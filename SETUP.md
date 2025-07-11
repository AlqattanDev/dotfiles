# 🚀 Dotfiles Setup Guide

## Quick Setup on a New Machine

### 1. Install Jujutsu (jj)
```bash
# Using Homebrew
brew install jj

# Or using Cargo
cargo install --git https://github.com/martinvonz/jj.git --bin jj jj-cli
```

### 2. Clone the Repository
```bash
jj git clone https://github.com/AlqattanDev/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Run Installation
```bash
./install.sh
```

### 4. Install Required Applications

#### Using Homebrew (Recommended)
```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install applications
brew install --cask aerospace ghostty karabiner-elements
brew install tmux neovim bat lazygit jj
```

#### Manual Downloads
- [Aerospace](https://github.com/nikitabobko/AeroSpace/releases)
- [Ghostty](https://ghostty.org/)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

### 5. Set Up Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 6. Grant Permissions
1. **System Preferences → Security & Privacy → Privacy**
2. **Accessibility**: Add Aerospace
3. **Input Monitoring**: Add Karabiner-Elements

### 7. Restart Applications
```bash
# Restart shell
exec zsh

# Restart Aerospace
aerospace reload-config

# Restart Karabiner
open -a "Karabiner-Elements"
```

## 🔄 Updating Configurations

Since all configs are symlinked to this repository and we use **Jujutsu (jj)**:

1. Edit files in `~/dotfiles/`
2. Changes are reflected immediately
3. Commit and push to save changes

```bash
cd ~/dotfiles

# Create a commit with your changes
jj describe -m "Update configuration: describe your changes"

# Push to GitHub
jj git push --bookmark main
```

## 🔧 Jujutsu Workflow

### Basic Commands
```bash
# View commit history
jj log

# Check current status
jj status

# Create a new commit
jj describe -m "Your commit message"

# Push changes
jj git push --bookmark main

# Pull latest changes
jj git fetch
jj rebase -d main@origin
```

### Advanced Operations
```bash
# Undo last operation (keeps working copy changes)
jj undo

# Edit commit message
jj describe

# Split a commit
jj split

# Squash commits
jj squash

# View diff
jj diff
```

## 🆘 Troubleshooting

### Aerospace Keys Not Working
1. Check System Preferences → Security & Privacy → Accessibility
2. Ensure Aerospace has permission
3. Restart Aerospace: `aerospace reload-config`

### Tmux Not Loading Config
```bash
tmux source-file ~/.config/tmux/tmux.conf
```

### Zsh Changes Not Applied
```bash
source ~/.zshrc
```

### Jujutsu Issues
```bash
# If you get conflicts during rebase
jj resolve  # Opens merge tool

# If you want to start over
jj undo     # Undo last operation

# View help for any command
jj help <command>
```

### Restore Original Configs
Your original configurations are backed up with `.backup` extension:
```bash
mv ~/.zshrc.backup ~/.zshrc
mv ~/.config/nvim.backup ~/.config/nvim
# etc.
```

## 🌟 Why Jujutsu?

- **Better conflict resolution** - No more merge hell
- **Immutable commits** - Safe to experiment and undo
- **Powerful revsets** - Query commits like a database
- **No staging area** - Simpler mental model
- **Built-in backup** - Every operation is reversible

Learn more at [jj-vcs.github.io](https://jj-vcs.github.io/jj/)
