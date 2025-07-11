# Tmux + Neovim Integration Guide

## Quick Start

### Starting Development Sessions

```bash
# Start a development session in current directory
~/.config/tmux/dev-session.sh

# Start with custom name and path
~/.config/tmux/dev-session.sh myproject ~/code/myproject

# Using aliases (after sourcing ~/.config/tmux/aliases.sh)
tdev                    # Start dev session in current dir
tdev myproject ~/code   # Start with custom name/path
tproject                # Start session named after current directory
tcode                   # Start coding session with split layout
```

## Key Bindings

### Tmux Prefix
- **Prefix**: `Ctrl-a` (changed from default `Ctrl-b`)

### Session Management
- `Prefix + d` - Detach from session
- `Prefix + s` - List and switch sessions
- `Prefix + $` - Rename session

### Window Management
- `Prefix + c` - Create new window (in current path)
- `Prefix + ,` - Rename window
- `Prefix + n` - Next window
- `Prefix + p` - Previous window
- `Prefix + 1-9` - Switch to window by number
- `Alt + Shift + h/l` - Switch windows without prefix

### Pane Management
- `Prefix + |` - Split horizontally
- `Prefix + -` - Split vertically
- `Prefix + x` - Close pane
- `Prefix + z` - Toggle pane zoom

### Navigation (Vim-style)
- `Alt + h/j/k/l` - Navigate panes without prefix
- `Ctrl + h/j/k/l` - Navigate between Neovim splits and tmux panes seamlessly
- `Prefix + h/j/k/l` - Resize panes

### Copy Mode (Vi-style)
- `Prefix + v` - Enter copy mode
- `v` - Start selection
- `y` - Copy selection (to system clipboard)
- `Ctrl + v` - Rectangle selection
- `q` or `Escape` - Exit copy mode

## Neovim Integration

### Seamless Navigation
The `vim-tmux-navigator` plugin allows seamless navigation between Neovim splits and tmux panes:

- `Ctrl + h` - Move left (Neovim split or tmux pane)
- `Ctrl + j` - Move down (Neovim split or tmux pane)
- `Ctrl + k` - Move up (Neovim split or tmux pane)
- `Ctrl + l` - Move right (Neovim split or tmux pane)

### In Neovim
- `:TmuxNavigateLeft/Down/Up/Right` - Navigate to tmux panes
- The navigation works automatically when you hit window boundaries

## Session Persistence

Sessions are automatically saved every 15 minutes and restored on tmux restart thanks to:
- `tmux-resurrect` - Manual save/restore
- `tmux-continuum` - Automatic continuous saving

### Manual Session Management
- `Prefix + Ctrl + s` - Save session
- `Prefix + Ctrl + r` - Restore session

## Useful Commands

### Session Management
```bash
tmux ls                          # List sessions
tmux attach -t session-name     # Attach to session
tmux kill-session -t name       # Kill session
tmux rename-session new-name    # Rename current session
```

### Development Workflow
1. Start tmux session: `tdev myproject ~/code/myproject`
2. Session creates:
   - Window 1: Neovim editor
   - Window 2: Terminal (split into multiple panes)
   - Window 3: Git operations
   - Window 4: Server/build processes

## Configuration Files

- `~/.tmux.conf` - Main tmux configuration
- `~/.config/tmux/dev-session.sh` - Development session script
- `~/.config/tmux/aliases.sh` - Shell aliases and functions
- `~/.config/nvim/lua/plugins/init.lua` - Neovim tmux integration

## Color Scheme

The configuration uses a Tokyo Night inspired color scheme:
- Background: Dark blue-gray (#1a1b26)
- Active elements: Blue (#7aa2f7)
- Highlights: Pink (#f7768e), Green (#9ece6a)
- Text: Light gray (#c0caf5)

## Tips

1. **Mouse Support**: Mouse is enabled for pane selection and resizing
2. **True Color**: Full 24-bit color support for better themes
3. **Clipboard**: Copy operations automatically sync with system clipboard
4. **Focus Events**: Neovim receives focus events for better integration
5. **Aggressive Resize**: Better multi-monitor support

## Troubleshooting

### Navigation Not Working
- Ensure `vim-tmux-navigator` is installed in Neovim
- Check that tmux configuration is loaded: `Prefix + r`

### Colors Look Wrong
- Ensure terminal supports true color
- Set `TERM=screen-256color` if needed

### Plugins Not Loading
- Install plugins: `Prefix + I`
- Reload tmux: `Prefix + r`
- Check TPM installation: `~/.tmux/plugins/tpm/`
