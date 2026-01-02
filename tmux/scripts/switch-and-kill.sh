#!/bin/bash

current_session=$(tmux display-message -p '#S')

sessions=$(tmux list-sessions -F '#{session_name}' | grep -v "^$current_session$")

count=$(echo "$sessions" | grep -c .)

if [ "$count" -eq 0 ]; then
    tmux display-message "No other sessions to switch to"
else
    tmux confirm-before -p "Kill session '$current_session' and switch to another? (y/n)" \
        "run-shell '~/.config/tmux/scripts/switch-and-kill-confirmed.sh $current_session'"
fi
