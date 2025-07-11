#!/bin/bash

# Tmux Aliases and Functions
# Source this file in your shell configuration (.zshrc, .bashrc, etc.)

# Basic tmux aliases
alias t='tmux'
alias ta='tmux attach'
alias tls='tmux list-sessions'
alias tn='tmux new-session'
alias tk='tmux kill-session'

# Development session functions
function tdev() {
    local session_name=${1:-"dev"}
    local project_path=${2:-$(pwd)}
    ~/.config/tmux/dev-session.sh "$session_name" "$project_path"
}

function tkill() {
    if [ -z "$1" ]; then
        echo "Usage: tkill <session-name>"
        echo "Available sessions:"
        tmux list-sessions -F "#{session_name}"
        return 1
    fi
    tmux kill-session -t "$1"
}

function tswitch() {
    if [ -z "$1" ]; then
        echo "Available sessions:"
        tmux list-sessions -F "#{session_name}"
        return 1
    fi
    tmux switch-client -t "$1" 2>/dev/null || tmux attach-session -t "$1"
}

# Quick project session
function tproject() {
    local project_name=$(basename $(pwd))
    tdev "$project_name" "$(pwd)"
}

# Tmux session with specific layout for coding
function tcode() {
    local session_name=${1:-"code"}
    local project_path=${2:-$(pwd)}
    
    if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
        return 0
    fi
    
    # Create session
    tmux new-session -d -s "$session_name" -c "$project_path"
    
    # Main window: split for editor and terminal
    tmux rename-window -t "$session_name:1" "main"
    tmux split-window -h -c "$project_path"
    tmux resize-pane -t 1 -x 80
    tmux send-keys -t "$session_name:main.0" "nvim ." Enter
    
    # Select editor pane and attach
    tmux select-pane -t 0
    tmux attach-session -t "$session_name"
}
