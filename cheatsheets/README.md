# 📚 Divine Dotfiles Cheatsheets

Comprehensive reference guides for all configurations in your dotfiles repository.

## 🗂️ Available Cheatsheets

### 🚀 [Aerospace](./aerospace.md)
**Tiling Window Manager**
- Alt+hjkl navigation
- Workspace management (Alt+1-9)
- Window movement and resizing
- Service mode for advanced operations

### 📺 [Tmux](./tmux.md)
**Terminal Multiplexer**
- Session management (tms, tma, tmk)
- Window and pane controls
- Custom development functions
- Prefix key: Ctrl+a

### 🐚 [Zsh](./zsh.md)
**Shell Configuration**
- Navigation aliases (.., ..., ....)
- Git workflow (gits, gitq, gitm)
- Development shortcuts (v, lg, nvc)
- Python environment management

### ⚡ [Neovim](./neovim.md)
**Text Editor**
- File management (leader+e, leader+ff)
- LSP integration (gd, gr, leader+ca)
- AI assistance with Avante
- NvChad base configuration

### 👻 [Ghostty](./ghostty.md)
**Terminal Emulator**
- Modern, fast terminal
- GPU acceleration
- Customizable themes and fonts
- Shell integration features

### ⌨️ [Karabiner](./karabiner.md)
**Keyboard Customizer**
- Currently clean configuration
- No conflicts with Aerospace
- Ready for custom modifications
- Permission management

### 📊 [Sketchybar](./sketchybar.md)
**Status Bar**
- System monitoring (CPU, memory, battery)
- Aerospace workspace indicator
- Custom plugins and themes
- Real-time updates

### 🤖 [Claude AI Tools](./claude.md)
**AI Assistance**
- Claude Code (TUI) for terminal
- Claude Desktop for GUI
- Development workflow integration
- Custom prompts and configurations

## 🚀 Quick Reference

### Most Used Commands
```bash
# Window Management (Aerospace)
Alt + h/j/k/l          # Navigate windows
Alt + 1-9              # Switch workspaces
Alt + Shift + h/j/k/l  # Move windows

# Terminal (Tmux)
tms <name>             # Switch to or create session
t                      # Start tmux
ta                     # Attach to session

# Shell (Zsh)
v                      # Open Neovim
lg                     # Open Lazygit
gitq                   # Quick git commit and push
..                     # Go up one directory

# Editor (Neovim)
<leader>ff             # Find files
<leader>e              # Toggle file explorer
gd                     # Go to definition
<leader>ca             # Code actions
```

### Configuration Locations
```
~/.config/
├── aerospace/         # Window manager
├── ghostty/          # Terminal emulator
├── karabiner/        # Keyboard customizer
├── nvim/             # Neovim editor
├── sketchybar/       # Status bar
├── tmux/             # Terminal multiplexer
├── ratatui-claude-code/  # Claude TUI
└── claude_prompts/   # Claude Desktop

~/.zshrc              # Shell configuration
```

## 🎯 Workflow Integration

### Development Workflow
1. **Start session**: `tms myproject`
2. **Open editor**: `v .`
3. **Navigate windows**: `Alt + h/j/k/l`
4. **Switch workspaces**: `Alt + 1-9`
5. **Git workflow**: `gitq` for quick commits

### Daily Usage
1. **Launch terminal**: `Alt + t` (Ghostty via Aerospace)
2. **Window management**: Alt+hjkl for navigation
3. **Status monitoring**: Sketchybar shows system info
4. **AI assistance**: `claude` for help
5. **File editing**: `v filename` for Neovim

## 🔧 Customization

### Adding New Configurations
1. Create config in appropriate `~/.config/` directory
2. Add to `~/dotfiles/` repository
3. Update `install.sh` if needed
4. Create cheatsheet in `~/dotfiles/cheatsheets/`
5. Commit with jj: `jj describe -m "Add new config"`

### Modifying Existing Configs
1. Edit files in `~/dotfiles/`
2. Changes apply immediately (symlinked)
3. Commit changes: `jj describe -m "Update config"`
4. Push to GitHub: `jj git push --bookmark main`

## 💡 Pro Tips

### Performance
- Zsh config is optimized for fast startup
- Lazy loading for package managers (NVM, Conda)
- Efficient PATH management
- Minimal plugin selection

### Productivity
- Use `tms` for quick session switching
- `gitq` for rapid git workflow
- Alt+hjkl becomes muscle memory
- AI assistance with Claude for complex tasks

### Maintenance
- All configs are version controlled with jj
- Automatic backups during installation
- Easy to restore or rollback changes
- Portable across machines

## 🔄 Getting Help

### Command Help
```bash
# Application help
aerospace --help
tmux list-keys
nvim --help
jj help

# Configuration validation
aerospace reload-config
tmux source-file ~/.config/tmux/tmux.conf
```

### Troubleshooting
1. Check individual cheatsheets for specific issues
2. Verify permissions (especially Aerospace and Karabiner)
3. Reload configurations after changes
4. Use `jj undo` to revert problematic changes

## 📖 Learning Path

### Beginner
1. Start with [Zsh](./zsh.md) for shell basics
2. Learn [Aerospace](./aerospace.md) window navigation
3. Master [Tmux](./tmux.md) session management

### Intermediate
4. Explore [Neovim](./neovim.md) editing features
5. Customize [Ghostty](./ghostty.md) terminal
6. Set up [Sketchybar](./sketchybar.md) monitoring

### Advanced
7. Add [Karabiner](./karabiner.md) customizations
8. Integrate [Claude](./claude.md) AI assistance
9. Create custom workflows and scripts

---

*Each cheatsheet is designed to be a quick reference. For detailed configuration, see the actual config files in your dotfiles repository.*
