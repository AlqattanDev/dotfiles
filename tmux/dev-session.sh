#!/bin/bash

# Tmux Development Session Script
# Usage: ./dev-session.sh [session-name] [project-path]

SESSION_NAME=${1:-"dev"}
PROJECT_PATH=${2:-"$HOME"}

# Check if session already exists
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    echo "Session '$SESSION_NAME' already exists. Attaching..."
    tmux attach-session -t "$SESSION_NAME"
    exit 0
fi

# Create new session
echo "Creating new tmux session: $SESSION_NAME"

# Start new session with first window
tmux new-session -d -s "$SESSION_NAME" -c "$PROJECT_PATH"

# Window 1: Editor (Neovim)
tmux rename-window -t "$SESSION_NAME:1" "editor"
tmux send-keys -t "$SESSION_NAME:1" "nvim ." Enter

# Window 2: Terminal
tmux new-window -t "$SESSION_NAME" -n "terminal" -c "$PROJECT_PATH"

# Window 3: Git/Tools
tmux new-window -t "$SESSION_NAME" -n "git" -c "$PROJECT_PATH"
tmux send-keys -t "$SESSION_NAME:git" "git status" Enter

# Window 4: Server/Build (if needed)
tmux new-window -t "$SESSION_NAME" -n "server" -c "$PROJECT_PATH"

# Split the terminal window for multiple tasks
tmux select-window -t "$SESSION_NAME:terminal"
tmux split-window -h -c "$PROJECT_PATH"
tmux split-window -v -c "$PROJECT_PATH"
tmux select-pane -t 0

# Focus on editor window
tmux select-window -t "$SESSION_NAME:editor"

# Attach to session
tmux attach-session -t "$SESSION_NAME"
