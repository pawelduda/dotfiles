#!/bin/sh
# Claude Code session status in the tmux window list and pane titles:
#   ● running   ◐ background tasks running   ? waiting for permission/answer
#   ◆ finished, not seen yet   ✓ finished
#
# Usage: ./install.sh              install or update (safe to re-run)
#        ./install.sh --uninstall  remove hooks and links
#
# Installs:
#   ~/.claude/hooks/tmux-status.sh      -> this dir (Claude Code hook)
#   ~/.config/tmux/claude-status.tmux   -> this dir (tmux snippet)
#   hooks merged into ~/.claude/settings.json (backup written next to it)
# ~/.tmux.conf must contain:  source-file -q ~/.config/tmux/claude-status.tmux
# and #{E:@claude_status_fmt} in window-status-format / window-status-current-format.
#
# Requires jq, perl, lsof and a recent tmux (tested with 3.7: needs #{P:}, pane options, user ranges).
set -eu

here=$(cd "$(dirname "$0")" && pwd)
hook_link=$HOME/.claude/hooks/tmux-status.sh
tmux_link=$HOME/.config/tmux/claude-status.tmux
settings=$HOME/.claude/settings.json
hook_cmd='~/.claude/hooks/tmux-status.sh'

for bin in jq perl lsof tmux; do
  command -v "$bin" >/dev/null || { echo "error: $bin is required" >&2; exit 1; }
done

tmux_running() { command tmux info >/dev/null 2>&1; }

# Rewrite settings.json through jq: drop our hook entries, then apply $1 (extra jq).
update_settings() {
  mkdir -p "$(dirname "$settings")"
  [ -f "$settings" ] || echo '{}' > "$settings"
  backup="$settings.bak-$(date +%Y%m%d-%H%M%S)"
  [ ! -e "$backup" ] || backup="$backup-$$"
  cp "$settings" "$backup"
  tmp=$(mktemp)
  jq --arg s "$hook_cmd" "
    def h(\$state): {type: \"command\", command: (\$s + \" \" + \$state)};
    .hooks = ((.hooks // {})
      | with_entries(.value |= map(.hooks |= map(select(.command | startswith(\$s) | not))
                                   | select(.hooks | length > 0)))
      | with_entries(select(.value | length > 0)))
    $1
    | if .hooks == {} then del(.hooks) else . end
  " "$backup" > "$tmp"
  cat "$tmp" > "$settings"   # keep settings.json itself (and any symlink) in place
  rm -f "$tmp"
  echo "updated $settings (backup: $backup)"
}

if [ "${1:-}" = --uninstall ]; then
  update_settings ''
  rm -f "$hook_link" "$tmux_link"
  echo "removed $hook_link and $tmux_link"
  if tmux_running; then
    command tmux list-panes -a -F '#{pane_id}' | xargs -I{} tmux set -p -t {} -u @claude
    echo "cleared status from running panes; restart tmux to drop its hooks/bindings"
  fi
  exit 0
fi

mkdir -p "$(dirname "$hook_link")" "$(dirname "$tmux_link")"
chmod +x "$here/tmux-status.sh"
ln -sfn "$here/tmux-status.sh" "$hook_link"
ln -sfn "$here/claude-status.tmux" "$tmux_link"
echo "linked $hook_link"
echo "linked $tmux_link"

update_settings '
  | .hooks.SessionStart       += [{matcher: "startup|resume|clear|fork", hooks: [h("start")]}]
  | .hooks.UserPromptSubmit   += [{hooks: [h("run")]}]
  | .hooks.MessageDisplay     += [{hooks: [h("run")]}]
  | .hooks.PreToolUse         += [{matcher: "*", hooks: [h("run")]}]
  | .hooks.PostToolUse        += [{matcher: "*", hooks: [h("run")]}]
  | .hooks.PostToolUseFailure += [{matcher: "*", hooks: [h("run")]}]
  | .hooks.Notification       += [{matcher: "permission_prompt|elicitation_dialog", hooks: [h("wait")]}]
  | .hooks.Stop               += [{hooks: [h("stop")]}]
  | .hooks.StopFailure        += [{hooks: [h("done")]}]
  | .hooks.SessionEnd         += [{hooks: [h("clear")]}]'

if ! grep -qs 'claude-status.tmux' "$HOME/.tmux.conf"; then
  cat <<EOF

NOTE: ~/.tmux.conf doesn't load the snippet yet. Add:
  source-file -q ~/.config/tmux/claude-status.tmux
and put #{E:@claude_status_fmt} into window-status-format and
window-status-current-format where the glyphs should appear.
EOF
fi

if tmux_running; then
  command tmux source-file "$HOME/.tmux.conf"
  # Pick up the state of Claude sessions that are already running.
  "$hook_link" sync
  echo "reloaded tmux config"
  echo "detach and reattach once so terminal focus tracking (focus-events) takes effect"
fi
echo "done. Restart Claude Code sessions that don't pick up the new hooks."
