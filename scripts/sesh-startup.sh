#!/usr/bin/env bash

# Usage: sesh-startup.sh <session_name> <session_path>

SESSION_NAME=$1
SESSION_PATH=$2

# Configurable variables
EDITOR_CMD="vim"
AGENT_CMD="gemini"

# Server rules: "marker_file::command"
SERVER_RULES=(
  "package.json::npm run dev"
  "go.mod::go run ."
)

# Create the vim window
tmux new-window -t "$SESSION_NAME" -n vim -c "$SESSION_PATH"
tmux send-keys -t "$SESSION_NAME":vim "$EDITOR_CMD" C-m

# Create the zsh window
tmux new-window -t "$SESSION_NAME" -n zsh -c "$SESSION_PATH"

# Create the agent window
tmux new-window -t "$SESSION_NAME" -n agent -c "$SESSION_PATH"
tmux send-keys -t "$SESSION_NAME":agent "$AGENT_CMD" C-m

# Detect and create the server window
server_cmd=""
for rule in "${SERVER_RULES[@]}"; do
  marker="${rule%%::*}"
  cmd="${rule##*::}"
  if [[ -f "$SESSION_PATH/$marker" ]]; then
    server_cmd="$cmd"
    break
  fi
done

if [[ -n "$server_cmd" ]]; then
  tmux new-window -t "$SESSION_NAME" -n server -c "$SESSION_PATH"
  tmux send-keys -t "$SESSION_NAME":server "$server_cmd" C-m
fi

# Select the vim window by default
tmux select-window -t "$SESSION_NAME":vim
