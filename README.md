# 👑 Divine Dotfiles

A meticulously crafted collection of configuration files for a powerful development environment on macOS.

## 🚀 Quick Start

```bash
# Clone this repository
jj git clone https://github.com/AlqattanDev/dotfiles.git ~/dotfiles

# Run the installation script
cd ~/dotfiles
./install.sh
```

## 📦 What's Included

### 🐚 Shell Environment
- **Zsh** - Optimized shell configuration with Oh My Zsh
- **Tmux** - Terminal multiplexer with custom key bindings and layouts

### 🎨 Window Management
- **Aerospace** - Tiling window manager with Hyprland-style keybindings
- **Sketchybar** - Custom status bar configuration

### 💻 Development Tools
- **Neovim** - Fully configured text editor with plugins and custom settings
- **Ghostty** - Modern terminal emulator configuration

### 🤖 AI Tools
- **Claude Code** - AI-powered coding assistant configuration
- **Claude Desktop** - Desktop app prompts and settings

### ⌨️ Input Management
- **Karabiner-Elements** - Keyboard customization and key remapping

## 🗂️ Directory Structure

```
dotfiles/
├── aerospace/          # Window manager configuration
├── claude-code/        # Claude Code TUI settings
├── claude-desktop/     # Claude Desktop prompts
├── ghostty/           # Terminal emulator config
├── karabiner/         # Keyboard remapping
├── nvim/              # Neovim configuration
├── sketchybar/        # Status bar configuration
├── tmux/              # Terminal multiplexer config
├── zsh/               # Shell configuration
├── install.sh         # Installation script
└── README.md          # This file
```

## ⌨️ Key Bindings

### Aerospace (Window Management)
- `Alt + h/j/k/l` - Focus windows (left/down/up/right)
- `Alt + Shift + h/j/k/l` - Move windows
- `Alt + 1-9` - Switch to workspace
- `Alt + Shift + 1-9` - Move window to workspace
- `Alt + q` - Close window
- `Alt + f` - Toggle fullscreen
- `Alt + t` - Open terminal (Ghostty)
- `Alt + b` - Open browser (Dia)

### Tmux
- `Prefix: Ctrl + a`
- `t` - New tmux session
- `ta` - Attach to session
- `tls` - List sessions
- `tms <name>` - Switch to or create session

### Zsh Aliases
- `v` / `vim` - Open Neovim
- `lg` - Open Lazygit
- `ll` - Long list files
- `..` / `...` / `....` - Navigate up directories
- `gits` - Git status (short)
- `gitq` - Quick commit and push

## 🛠️ Installation Details

The `install.sh` script will:

1. **Backup existing configurations** - Your current configs are saved as `.backup` files
2. **Create symlinks** - Links your home directory configs to this repository
3. **Reload configurations** - Automatically reloads changed configs where possible

### Manual Steps After Installation

1. **Install required applications:**
   ```bash
   # Using Homebrew
   brew install --cask aerospace ghostty karabiner-elements
   brew install tmux neovim jj
   ```

2. **Set up Oh My Zsh** (if not already installed):
   ```bash
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

3. **Grant permissions:**
   - Aerospace: System Preferences → Security & Privacy → Accessibility
   - Karabiner: System Preferences → Security & Privacy → Input Monitoring

## 🔄 Updating Configurations

Since all configurations are symlinked to this repository and we use **Jujutsu (jj)** for version control:

1. **Edit files directly** in the `~/dotfiles/` directory
2. **Changes are reflected immediately** in your system
3. **Commit and push** to keep your configurations versioned

```bash
cd ~/dotfiles

# Create a new commit with your changes
jj describe -m "Update configuration: describe your changes"

# Push to GitHub
jj git push --bookmark main
```

## 🌟 Features

### Performance Optimized
- Lazy loading for package managers (NVM, Conda)
- Efficient PATH management
- Fast shell startup times

### Developer Friendly
- Git workflow aliases
- Python virtual environment shortcuts
- Project-specific configurations
- AI tool integrations

### Aesthetic & Functional
- Clean, minimal UI
- Vim-style navigation everywhere
- Consistent color schemes
- Productive workspace layouts

### Modern Version Control
- Uses **Jujutsu (jj)** for superior version control experience
- Better conflict resolution than git
- Immutable commits with easy history editing
- Powerful revset queries for complex operations

## 🔧 Jujutsu Commands

Common jj commands for managing your dotfiles:

```bash
# View commit history
jj log

# Create a new commit
jj describe -m "Your commit message"

# Push changes
jj git push --bookmark main

# Pull changes
jj git fetch && jj rebase -d main@origin

# View current status
jj status

# Undo last commit (keeps changes)
jj undo
```

## 🤝 Contributing

Feel free to fork this repository and customize it for your own needs. If you have improvements or fixes, pull requests are welcome!

## 📝 License

This configuration is provided as-is for personal use. Feel free to use, modify, and distribute.

---

*"The expert in anything was once a beginner."* - Helen Hayes
