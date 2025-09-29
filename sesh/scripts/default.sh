# Window 1: vim
tmux new-window -n vim
tmux send-keys -t vim "vim" Enter

# Window 2: shell
tmux new-window -n zsh

# Window 3: agent
tmux new-window -n agent
tmux send-keys -t agent "gemini" Enter

# Kill the original first window (usually index 0)
tmux kill-window -t 1

# Optional: select vim window after all windows are created
tmux select-window -t vim
