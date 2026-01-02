#!/bin/bash

current_session=$1

target_session=$(sesh list -t --icons | grep -v "$current_session" | fzf-tmux -p 80%,70% \
  --no-sort --ansi --border-label ' sesh ' --prompt '🪟  ' \
  --bind 'tab:down,btab:up' \
  --preview-window 'right:55%' \
  --preview 'sesh preview {}')

if [ -n "$target_session" ]; then
    sesh connect "$target_session"
fi
tmux kill-session -t "$current_session"
