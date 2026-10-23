# Claude Code session status for tmux. Installed by install.sh, sourced from ~/.tmux.conf.
# Show it in the window list by adding #{E:@claude_status_fmt} to your
# window-status-format / window-status-current-format.

# Terminal focus reporting, used to decide whether a finished turn was seen.
# Clients must detach and reattach once after this is first enabled.
set -g focus-events on

# Claude Code session status per pane (set by ~/.claude/hooks/tmux-status.sh):
# ● running, ◐ idle but background tasks still running, ? waiting for permission/answer,
# ◆ finished but not seen yet, ✓ finished
set -g @claude_glyph '#{?#{==:#{@claude},run},#[fg=#e0af68]●,}#{?#{==:#{@claude},bg},#[fg=#e0af68]◐,}#{?#{==:#{@claude},wait},#[fg=#f7768e]?,}#{?#{==:#{@claude},unread},#[fg=#9ece6a]◆,}#{?#{==:#{@claude},done},#[fg=#9ece6a]✓,}'
# one glyph per Claude pane in the window list; each glyph is a clickable
# range (incl. the space before it, since the hit area lands one cell right
# of the drawn glyph) that focuses its pane, then hands back to the window range
# Reconcile panes with Claude Code's own session status files every
# status-interval (catches what hooks miss, e.g. daemon-hosted sessions)
set -g status-interval 5
set -g @claude_status_fmt '#(~/.claude/hooks/tmux-status.sh sync)#{P:#{?@claude,#[range=user|#{pane_id}] #{E:@claude_glyph}#[range=window|#{window_index}],}}'
# click on a glyph -> focus that pane; anywhere else -> default behaviour
bind -n MouseDown1Status if -F '#{m:%*,#{mouse_status_range}}' {
  # run -C expands #{mouse_status_range} before running (if-shell branches don't)
  run -C 'select-window -t "#{mouse_status_range}" ; select-pane -t "#{mouse_status_range}"'
} {
  switch-client -t =
}
# glyph at the left of the pane title (rest is tmux's default pane-border-format)
set -g pane-border-format "#{?@claude,#{E:@claude_glyph}#[default] ,}#{?pane_active,#[reverse],}#{pane_index}#[default] \"#{pane_title}\"#{?#{mouse},#[align=right]#[range=control|8][#{?#{window_zoomed_flag},u,z}]#[norange]#[range=control|9][x]#[norange],}"
# Mark a finished Claude pane as read once it is focused (pane/window/session switch or terminal regaining focus)
set-hook -g window-pane-changed    "if -F '#{==:#{@claude},unread}' 'set -p @claude done'"
set-hook -g session-window-changed "if -F '#{==:#{@claude},unread}' 'set -p @claude done'"
set-hook -g client-session-changed "if -F '#{==:#{@claude},unread}' 'set -p @claude done'"
set-hook -g client-attached        "if -F '#{==:#{@claude},unread}' 'set -p @claude done'"
set-hook -g client-focus-in        "if -F '#{==:#{@claude},unread}' 'set -p @claude done'"
