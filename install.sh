#!/bin/bash

# Dotfiles Installation Script
# This script creates symlinks from your home directory to the dotfiles repository

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}🚀 Setting up dotfiles from ${DOTFILES_DIR}${NC}"

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    local target_dir="$(dirname "$target")"
    
    # Create target directory if it doesn't exist
    mkdir -p "$target_dir"
    
    # Backup existing file/directory if it exists and isn't already a symlink to our dotfiles
    if [[ -e "$target" && ! -L "$target" ]]; then
        echo -e "${YELLOW}📦 Backing up existing $target to $target.backup${NC}"
        mv "$target" "$target.backup"
    elif [[ -L "$target" ]]; then
        echo -e "${YELLOW}🔗 Removing existing symlink $target${NC}"
        rm "$target"
    fi
    
    # Create the symlink
    echo -e "${GREEN}🔗 Linking $source -> $target${NC}"
    ln -sf "$source" "$target"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo -e "${BLUE}📋 Creating configuration symlinks...${NC}"

# Zsh configuration
if [[ -f "$DOTFILES_DIR/zsh/.zshrc" ]]; then
    create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
fi

# Ghostty configuration
if [[ -d "$DOTFILES_DIR/ghostty" ]]; then
    create_symlink "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"
fi

# Tmux configuration
if [[ -d "$DOTFILES_DIR/tmux" ]]; then
    create_symlink "$DOTFILES_DIR/tmux" "$HOME/.config/tmux"
fi

# Aerospace configuration
if [[ -d "$DOTFILES_DIR/aerospace" ]]; then
    create_symlink "$DOTFILES_DIR/aerospace" "$HOME/.config/aerospace"
fi

# Sketchybar configuration
if [[ -d "$DOTFILES_DIR/sketchybar" ]]; then
    create_symlink "$DOTFILES_DIR/sketchybar" "$HOME/.config/sketchybar"
fi

# Neovim configuration
if [[ -d "$DOTFILES_DIR/nvim" ]]; then
    create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
fi

# Karabiner configuration
if [[ -d "$DOTFILES_DIR/karabiner" ]]; then
    create_symlink "$DOTFILES_DIR/karabiner" "$HOME/.config/karabiner"
fi

# Claude Code configuration
if [[ -d "$DOTFILES_DIR/claude-code" ]]; then
    create_symlink "$DOTFILES_DIR/claude-code" "$HOME/.config/ratatui-claude-code"
fi

# Claude Desktop configuration
if [[ -d "$DOTFILES_DIR/claude-desktop" ]]; then
    create_symlink "$DOTFILES_DIR/claude-desktop" "$HOME/.config/claude_prompts"
fi

echo -e "${GREEN}✅ Dotfiles installation complete!${NC}"

# Reload configurations
echo -e "${BLUE}🔄 Reloading configurations...${NC}"

# Reload zsh if we're in zsh
if [[ -n "$ZSH_VERSION" ]]; then
    echo -e "${GREEN}🐚 Reloading zsh configuration${NC}"
    source ~/.zshrc
fi

# Reload aerospace if it's running
if command_exists aerospace; then
    echo -e "${GREEN}🚀 Reloading Aerospace configuration${NC}"
    aerospace reload-config
fi

# Reload tmux if it's running
if command_exists tmux && tmux list-sessions >/dev/null 2>&1; then
    echo -e "${GREEN}📺 Reloading tmux configuration${NC}"
    tmux source-file ~/.config/tmux/tmux.conf
fi

echo -e "${GREEN}🎉 All done! Your dotfiles are now managed from ${DOTFILES_DIR}${NC}"
echo -e "${BLUE}💡 To update configurations, edit files in ${DOTFILES_DIR} and they'll be reflected immediately${NC}"
