#!/usr/bin/env bash

### ── Configurable Variables ──────────────────────────────
PROJECT_DIRS=(
  "$HOME/Documents/Projects/"
  "$HOME/.config"
  "$HOME/Documents/srew-softwares/"
)
FZF_CMD="fzf"                        # fuzzy finder (can be fzf-tmux, etc.)
EDITOR_CMD="vim"                     # editor to launch in vim window
AGENT_CMD="gemini"                   # command to run in agent window
SESSIONIZER_DEPTH=1                  # search depth in each PROJECT_DIR

# Server rules: "marker_file::command"
SERVER_RULES=(
  "package.json::npm run dev"
  "go.mod::go run ."
)
### ───────────────────────────────────────────────────────

# # collect all dirs from all project roots
# all_projects=$(fd --type d --max-depth "$SESSIONIZER_DEPTH" . "${PROJECT_DIRS[@]}")
#
# # pick a project with fzf
# selected=${1:-$(echo "$all_projects" | $FZF_CMD)}
# [[ -z "$selected" ]] && exit 0

all_projects=()

for dir in "${PROJECT_DIRS[@]}"; do
  if [[ "$dir" == */ ]]; then
    # trailing slash → search inside for subdirs
    while IFS= read -r sub; do
      all_projects+=("$sub")
    done < <(fd --type d --max-depth "$SESSIONIZER_DEPTH" . "$dir")
  else
    # no trailing slash → treat the directory itself as a project
    all_projects+=("$dir")
  fi
done

# turn array into list for fzf
selected=${1:-$(printf "%s\n" "${all_projects[@]}" | $FZF_CMD)}
[[ -z "$selected" ]] && exit 0

# session name = directory basename
session=$(basename "$selected")
session=${session#.}                       # strip leading dot if present
session=$(echo "$session" | tr . _)

# detect server command by checking files
server_cmd=""
for rule in "${SERVER_RULES[@]}"; do
  marker="${rule%%::*}"
  cmd="${rule##*::}"
  if [[ -f "$selected/$marker" ]]; then
    server_cmd="$cmd"
    break
  fi
done

# create session and all windows in sync
if ! tmux has-session -t "$session" 2>/dev/null; then
  # vim window
  tmux new-session -d -s "$session" -c "$selected" -n vim
  tmux send-keys -t "$session":vim "$EDITOR_CMD" C-m

  # zsh window
  tmux new-window -t "$session" -n zsh -c "$selected"

  # agent window
  tmux new-window -t "$session" -n agent -c "$selected"
  tmux send-keys -t "$session":agent "$AGENT_CMD" C-m

  # server window (only if rule matched)
  if [[ -n "$server_cmd" ]]; then
    tmux new-window -t "$session" -n server -c "$selected"
    tmux send-keys -t "$session":server "$server_cmd" C-m
  fi
fi

# attach/switch and always end up in vim
if [[ -z "$TMUX" ]]; then
  tmux attach-session -t "$session" \; select-window -t "$session":vim
else
  tmux switch-client -t "$session" \; select-window -t "$session":vim
fi
