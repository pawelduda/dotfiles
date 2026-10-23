#!/bin/sh
# Claude Code session status on tmux panes (@claude), rendered by claude-status.tmux.
#
# Hook usage (hook JSON on stdin): tmux-status.sh run|wait|done|clear|start|stop
#   start  session started: remember when, then like done
#   stop   turn finished: bg if background tasks are still running, else like done
#   done   becomes unread unless the pane is in view; tmux hooks in
#          claude-status.tmux flip unread to done when the pane is focused
# Poll usage: tmux-status.sh sync
#   Reconciles every pane with Claude Code's own status files
#   (~/.claude/sessions/<pid>.json). Covers what hooks can't see: turns started
#   by background-task notifications, Esc interrupts, killed sessions, and
#   sessions handed off to the Claude daemon (whose hooks run outside tmux).

state=${1:-}
[ "$state" = sync ] || input=$(cat)

# Background tasks (background Bash, async/remote agents) launched at/after
# $2 (epoch) in transcript $1 without a completion notification. A Bash task
# only counts while some process still has its output file open.
bg_pending() {
  [ -f "$1" ] || return 1
  # perl prefilter: BSD grep -E takes ~0.5s on a 25MB transcript, perl ~30ms
  perl -ne 'print if /backgroundTaskId|_launched|task-notification|"TaskStop"/' "$1" |
    jq -rn --argjson since "${2:-0}" '
      def ts: (.timestamp // "1970-01-01T00:00:00Z") | sub("\\.[0-9]+Z$"; "Z") | fromdateiso8601;
      [inputs] as $lines
      | ([$lines[] | tostring | scan("<(?:tool-use-id|task-id)>([^<\\\\]+)") | .[0]]
         + [$lines[] | select(.type == "assistant") | .message.content[]?
            | select(.type == "tool_use" and .name == "TaskStop") | (.input.task_id // .input.shell_id // empty)]
         | map({(.): true}) | add // {}) as $done
      | $lines[]
      | select(.type == "user" and (.toolUseResult | type) == "object" and ts >= $since)
      | .toolUseResult as $r
      | select($r.backgroundTaskId or $r.status == "async_launched" or $r.status == "remote_launched")
      | (.message.content[]? | select(.type == "tool_result")) as $res
      | select([$res.tool_use_id, $r.backgroundTaskId, $r.agentId, $r.taskId] | any(. != null and $done[.]) | not)
      | if $r.backgroundTaskId then
          "bash " + (($res.content | tostring | capture("written to: (?<p>[^ \\\\\"]+\\.output)") | .p) // "")
        else "agent" end' |
    while read -r kind path; do
      if [ "$kind" = agent ] || { [ -n "$path" ] && lsof -t -- "$path" >/dev/null 2>&1; }; then
        echo pending
        break
      fi
    done | grep -q pending
}

# Seen = active pane of the active window, and a client showing that session
# has terminal focus (needs focus-events on in tmux).
seen() {
  [ "$(tmux display -p -t "$1" '#{&&:#{pane_active},#{window_active}}')" = 1 ] &&
    tmux list-clients -t "$1" -F '#{client_flags}' | grep -q '\bfocused\b'
}

# finished PANE [TRANSCRIPT SINCE] -> bg, done or unread
finished() {
  if [ -n "${2:-}" ] && bg_pending "$2" "${3:-0}"; then echo bg
  elif seen "$1"; then echo done
  else echo unread
  fi
}

sync() {
  panes=$(tmux list-panes -a -F '#{pane_id} #{pane_current_command} #{@claude}')
  # Claude no longer in the foreground of a pane: drop its glyph.
  printf '%s\n' "$panes" | while read -r pane cmd cur; do
    [ -n "$cur" ] && [ "$cmd" != claude ] && tmux set -p -t "$pane" -u @claude
  done
  # One row per session shown in a tmux pane. A pane whose session was handed
  # to the daemon (parkedJobId) reports the status of the daemon's worker.
  set -- "$HOME"/.claude/sessions/*.json
  [ -f "$1" ] || return 0
  jq -rs '
    (map(select(.jobId != null) | {(.jobId): .}) | add // {}) as $jobs
    | .[] | select(.tmux != null)
    | (if .parkedJobId != null and $jobs[.parkedJobId] != null then $jobs[.parkedJobId] else . end) as $s
    | [.pid, $s.pid, (.tmux | sub("^.*\\."; "")), $s.status, $s.sessionId, $s.cwd,
       (($s.startedAt // 0) / 1000 | floor)] | @tsv' "$@" 2>/dev/null |
  while IFS="$(printf '\t')" read -r pid wpid pane status sid cwd since; do
    kill -0 "$pid" 2>/dev/null && kill -0 "$wpid" 2>/dev/null || continue
    line=$(printf '%s\n' "$panes" | grep "^$pane claude" | head -1)
    [ -n "$line" ] || continue
    cur=${line#"$pane claude"}; cur=${cur# }
    case $status in
      busy) new=run ;;
      waiting) new=wait ;;
      idle)
        case $cur in
          ''|run|wait|bg)
            transcript=$HOME/.claude/projects/$(printf '%s' "$cwd" | sed 's/[^A-Za-z0-9]/-/g')/$sid.jsonl
            new=$(finished "$pane" "$transcript" "$since") ;;
          *) new=$cur ;;
        esac ;;
      *) new=$cur ;;
    esac
    [ "$new" = "$cur" ] || tmux set -p -t "$pane" @claude "$new"
  done
}

if [ "$state" = sync ]; then
  sync
  exit 0
fi

if [ -z "${TMUX_PANE:-}" ]; then
  # Hooks of a daemon-hosted session run outside tmux; reconcile from status files.
  [ "${CLAUDE_CODE_SESSION_KIND:-}" = bg ] && command -v tmux >/dev/null && sync
  exit 0
fi

case $state in
  start)
    tmux set-option -p -t "$TMUX_PANE" @claude_since "$(date +%s)"
    state=$(finished "$TMUX_PANE") ;;
  stop)
    transcript=$(printf '%s' "$input" | jq -r '.transcript_path // empty')
    state=$(finished "$TMUX_PANE" "$transcript" "$(tmux show -pqv -t "$TMUX_PANE" @claude_since)") ;;
  done)
    state=$(finished "$TMUX_PANE") ;;
esac

if [ "$state" = clear ]; then
  tmux set-option -p -t "$TMUX_PANE" -u @claude
  tmux set-option -p -t "$TMUX_PANE" -u @claude_since
else
  tmux set-option -p -t "$TMUX_PANE" @claude "$state"
fi
tmux refresh-client -S 2>/dev/null
exit 0
