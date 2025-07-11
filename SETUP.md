# 🚀 Dotfiles Setup Guide

## Quick Setup on a New Machine

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Run Installation
```bash
./install.sh
```

### 3. Install Required Applications

#### Using Homebrew (Recommended)
```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install applications
brew install --cask aerospace ghostty karabiner-elements
brew install tmux neovim bat lazygit
```

#### Manual Downloads
- [Aerospace](https://github.com/nikitabobko/AeroSpace/releases)
- [Ghostty](https://ghostty.org/)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

### 4. Set Up Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 5. Grant Permissions
1. **System Preferences → Security & Privacy → Privacy**
2. **Accessibility**: Add Aerospace
3. **Input Monitoring**: Add Karabiner-Elements

### 6. Restart Applications
```bash
# Restart shell
exec zsh

# Restart Aerospace
aerospace reload-config

# Restart Karabiner
open -a "Karabiner-Elements"
```

## 🔄 Updating Configurations

Since all configs are symlinked to this repository:

1. Edit files in `~/dotfiles/`
2. Changes are reflected immediately
3. Commit and push to save changes

```bash
cd ~/dotfiles
git add .
git commit -m "Update configuration"
git push
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

### Restore Original Configs
Your original configurations are backed up with `.backup` extension:
```bash
mv ~/.zshrc.backup ~/.zshrc
mv ~/.config/nvim.backup ~/.config/nvim
# etc.
```
