#!/usr/bin/env zsh
# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# ================================================================
# 👑 DIVINE ZSH CONFIGURATION 👑
# ================================================================
# A meticulously crafted shell environment for the enlightened user
# Organized, optimized, and elegant - as it should be.

# ================================================================
# 🚀 PERFORMANCE OPTIMIZATIONS
# ================================================================

# ================================================================
# 🌍 CORE ENVIRONMENT
# ================================================================

# Locale and language settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Default editors (in order of preference)
export VISUAL=nvim
export EDITOR='nvim'

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ================================================================
# 🛡️ SECURITY & CREDENTIALS
# ================================================================

# Load sensitive environment variables
[[ -f "$HOME/.secrets.sh" ]] && source "$HOME/.secrets.sh"
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# ================================================================
# 🛣️  PATH MANAGEMENT
# ================================================================

# Function to safely add to PATH (avoiding duplicates)
path_prepend() {
    [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]] && PATH="$1:$PATH"
}

path_append() {
    [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]] && PATH="$PATH:$1"
}

# Core paths (order matters - first found wins)
path_prepend "$HOME/bin"
path_prepend "/opt/homebrew/bin"
path_prepend "/opt/homebrew/opt/openjdk/bin"
path_prepend "/opt/homebrew/opt/mysql-client/bin"

# User-specific paths
path_append "$HOME/.local/bin"
path_append "$HOME/.npm-global/bin"
path_append "$HOME/.bun/bin"
path_append "$HOME/go/bin"
path_append "$HOME/.cargo/bin"

# Android SDK
export ANDROID_HOME=~/Library/Android/sdk
path_append "$ANDROID_HOME/cmdline-tools/latest/bin"
path_append "$ANDROID_HOME/platform-tools"

export PATH

# ================================================================
# 🐍 PYTHON ECOSYSTEM
# ================================================================

# Python version aliases
alias python3.12='/opt/homebrew/bin/python3.12'
alias pip3.12='/opt/homebrew/bin/pip3.12'

# Virtual environment shortcuts
alias pyv='$HOME/virtualenvs/adhoc/bin/python'
alias piv='$HOME/virtualenvs/adhoc/bin/pip'

# Jupyter shortcuts with enhanced styling
alias jn='$HOME/virtualenvs/adhoc/bin/jupyter notebook'
alias jc='$HOME/virtualenvs/adhoc/bin/jupyter console'
export JUPYTER_NOTEBOOK_STYLE='from IPython.display import HTML;HTML("<style>div.text_cell_render{font-size:130%;padding-top:50px;padding-bottom:50px}</style>")'

# ================================================================
# 📝 DEVELOPMENT TOOLS
# ================================================================

# Git workflow aliases (optimized for speed)
alias gits='git status --short --branch'
alias gita='git add --update'
alias gitp='git push'
alias gitc='aicommits'  # AI-powered commits

# Git functions for complex operations
gitm() { git commit --message "$*"; }
gitu() { git commit --message "Update $(date +'%Y-%m-%d %H:%M')"; }
gitq() { git add --update && gitu && git push; }

# Editor shortcuts
alias v='nvim'
alias vim='nvim'
alias leet='nvim leetcode.nvim'

# Quick note creation
nn() {
    local file="$HOME/Downloads/$1"
    touch "$file" && mate "$file"
}

# ================================================================
# 🗂️  NAVIGATION & FILE MANAGEMENT
# ================================================================

# Enhanced listing aliases
alias cat='bat --plain --paging=never'
alias lr='ls -lAhrt'  # List by time, human readable
alias ll='ls -lAh'    # Long list, human readable

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Utility shortcuts
alias cl='clear'
alias z='cd'
alias pwdy='pwd | pbcopy'  # Copy current path

# Directory operations
alias md='mkdir -p'
alias rd='rmdir'

# ================================================================
# 🎯 PROJECT & WORKSPACE SHORTCUTS
# ================================================================

# Development environments
alias nvc='cd "$HOME/.config/nvim" && nvim'
alias zc='cd "$HOME/pro/zazencodes-season-2/src"'

# Obsidian workspace
alias oo='cd "$HOME/library/Mobile Documents/iCloud~md~obsidian/Documents/ZazenCodes"'
alias or='nvim "$HOME/library/Mobile Documents/iCloud~md~obsidian/Documents/ZazenCodes/inbox"/*.md'
alias ou='cd "$HOME/notion-obsidian-sync-zazencodes" && node batchUpload.js --lastmod-days-window 5'
alias komo='cd "$HOME/Google Drive/Other computers/My MacBook Pro/Obsidian/Komorebi Art Gallery"'

# ================================================================
# 🛠️  APPLICATION ALIASES
# ================================================================

# Enhanced development tools
alias lg='lazygit'
alias vue='$HOME/.yarn/bin/vue'
alias httpx='$HOME/go/bin/httpx'

# Java applications
alias sqlj='java -jar /Applications/SQLWorkbenchJ.app/Contents/Java/sqlworkbench.jar </dev/null &>/dev/null &'

# AI and LLM tools
alias llm_deepseek='llm -m deepseek-r1:8b'
alias llm_cat_dir='find . -maxdepth 1 -type f | xargs -I {} sh -c '\''echo "\n=== {} ===\n"; cat {}'\'''

# Task Master
alias taskmaster='task-master'

# ================================================================
# 🎨 OH-MY-ZSH FRAMEWORK
# ================================================================

# Framework configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"  # Simple, fast theme

# Carefully selected plugins for performance and functionality
plugins=(
    git                    # Git integration
    colored-man-pages      # Colorized man pages
    colorize              # Syntax highlighting for common files
    python                # Python helper functions
    macos                 # macOS-specific aliases
)

# Load Oh My Zsh (only if installed)
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# ================================================================
# 📦 PACKAGE MANAGERS & RUNTIMES
# ================================================================

# Node Version Manager (lazy loading for performance)
export NVM_DIR="$HOME/.nvm"
nvm() {
    unset -f nvm
    [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
    nvm "$@"
}

# Bun runtime
export BUN_INSTALL="$HOME/.bun"
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# ================================================================
# 🐍 CONDA ENVIRONMENT
# ================================================================

# Conda initialization (managed by conda init)
__conda_setup="$('/Users/alialqattan/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/alialqattan/miniforge3/etc/profile.d/conda.sh" ]; then
        source "/Users/alialqattan/miniforge3/etc/profile.d/conda.sh"
    else
        path_prepend "/Users/alialqattan/miniforge3/bin"
    fi
fi
unset __conda_setup

# ================================================================
# 📊 TELEMETRY & MONITORING
# ================================================================

# OpenTelemetry configuration
export OTEL_METRICS_EXPORTER=otlp
export OTEL_LOGS_EXPORTER=otlp
export OTEL_EXPORTER_OTLP_PROTOCOL=grpc
export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317

# Optimized export intervals for development
export OTEL_METRIC_EXPORT_INTERVAL=10000  # 10 seconds
export OTEL_LOGS_EXPORT_INTERVAL=5000     # 5 seconds

# ================================================================
# 🔧 TMUX INTEGRATION
# ================================================================

# Tmux aliases (consolidated and optimized)
alias t='tmux'
alias ta='tmux attach'
alias tls='tmux list-sessions'
alias tn='tmux new-session'
alias tk='tmux kill-session'
alias tma='tmux attach -t'
alias tmn='tmux new-session -s'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t'

# Quick session switcher
function tms() {
    if [ $# -eq 0 ]; then
        tmux list-sessions
    else
        tmux attach -t "$1" 2>/dev/null || tmux new-session -s "$1"
    fi
}

# Load tmux configuration and additional aliases
[[ -f "$HOME/.config/tmux/aliases.sh" ]] && source "$HOME/.config/tmux/aliases.sh"

# ================================================================
# 📚 CUSTOM FUNCTIONS
# ================================================================

# Enhanced directory listing with Git status
lsg() {
    ls -la "$@"
    [[ -d .git ]] && echo "\n📊 Git Status:" && git status --short --branch
}

# Quick project setup
mkproject() {
    mkdir -p "$1" && cd "$1" && git init && touch README.md
    echo "🚀 Project '$1' initialized with Git repository"
}

# ================================================================
# 🏁 INITIALIZATION HOOKS
# ================================================================

# ================================================================
# END OF DIVINE CONFIGURATION
# ================================================================
# "The expert in anything was once a beginner." - Helen Hayes

# Add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# opencode
export PATH=/Users/alialqattan/.opencode/bin:$PATH
source /Users/alialqattan/.zsh_copilot_aliases

# ==== TERMINAL COMPATIBILITY SETTINGS FOR GHOSTTY/SSH/TMUX ====
# Terminal settings for better SSH and tmux compatibility
export TERM="xterm-256color"
export COLORTERM="truecolor"

# Locale settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Fix delete key and other keys in SSH sessions
[[ $- == *i* ]] && {
    # Enable proper key bindings
    bindkey "^[[3~" delete-char
    bindkey "^[[H" beginning-of-line
    bindkey "^[[F" end-of-line
    bindkey "^[[1;5C" forward-word
    bindkey "^[[1;5D" backward-word
}

# Function to reset terminal when things get garbled
reset-terminal() {
    printf '\033c'
    export TERM="xterm-256color"
    clear
    echo "Terminal reset!"
}

# Alias for quick terminal reset
alias fix-term='reset-terminal'
alias rt='reset-terminal'

# ==== END TERMINAL COMPATIBILITY SETTINGS ====

