# 📺 Tmux Cheatsheet

Tmux is a terminal multiplexer that allows multiple terminal sessions in a single window.

## 🎮 Prefix Key
**Default Prefix**: `Ctrl + a`

All tmux commands start with the prefix key followed by another key.

## 🪟 Session Management
| Command | Action |
|---------|--------|
| `tmux` or `t` | Start new tmux session |
| `tmux new-session -s <name>` or `tmn <name>` | Create named session |
| `tmux attach -t <name>` or `tma <name>` | Attach to session |
| `tmux list-sessions` or `tls` | List all sessions |
| `tmux kill-session -t <name>` or `tmk <name>` | Kill session |
| `tms <name>` | Switch to session or create if doesn't exist |
| `tms` (no args) | List all sessions |

## 🔧 Session Controls (Inside Tmux)
| Key Combination | Action |
|----------------|--------|
| `Prefix + d` | Detach from session |
| `Prefix + s` | List and switch sessions |
| `Prefix + $` | Rename current session |
| `Prefix + (` | Switch to previous session |
| `Prefix + )` | Switch to next session |

## 🪟 Window Management
| Key Combination | Action |
|----------------|--------|
| `Prefix + c` | Create new window |
| `Prefix + ,` | Rename current window |
| `Prefix + n` | Next window |
| `Prefix + p` | Previous window |
| `Prefix + 0-9` | Switch to window by number |
| `Prefix + &` | Kill current window |
| `Prefix + w` | List and switch windows |

## 📱 Pane Management
| Key Combination | Action |
|----------------|--------|
| `Prefix + %` | Split pane vertically |
| `Prefix + "` | Split pane horizontally |
| `Prefix + x` | Kill current pane |
| `Prefix + z` | Toggle pane zoom |
| `Prefix + !` | Break pane into new window |

## 🧭 Pane Navigation
| Key Combination | Action |
|----------------|--------|
| `Prefix + h` | Move to left pane |
| `Prefix + j` | Move to bottom pane |
| `Prefix + k` | Move to top pane |
| `Prefix + l` | Move to right pane |
| `Prefix + ;` | Move to last active pane |
| `Prefix + o` | Cycle through panes |

## 📐 Pane Resizing
| Key Combination | Action |
|----------------|--------|
| `Prefix + Ctrl + h` | Resize pane left |
| `Prefix + Ctrl + j` | Resize pane down |
| `Prefix + Ctrl + k` | Resize pane up |
| `Prefix + Ctrl + l` | Resize pane right |

## 📋 Copy Mode
| Key Combination | Action |
|----------------|--------|
| `Prefix + [` | Enter copy mode |
| `Space` | Start selection |
| `Enter` | Copy selection |
| `Prefix + ]` | Paste |
| `q` | Exit copy mode |

## 🔧 Configuration Commands
```bash
# Reload tmux configuration
tmux source-file ~/.config/tmux/tmux.conf
# or inside tmux:
# Prefix + r

# List all tmux commands
tmux list-commands

# Show all key bindings
tmux list-keys
```

## 🚀 Custom Functions
| Function | Action |
|----------|--------|
| `tdev <name> <path>` | Create development session |
| `tkill <name>` | Kill specific session |
| `tswitch <name>` | Switch to session |
| `tproject` | Create session for current directory |
| `tcode <name> <path>` | Create coding session with split layout |

## 💡 Development Workflow
```bash
# Start a new development session
tdev myproject ~/code/myproject

# Create a coding session with editor + terminal
tcode myapp ~/code/myapp

# Quick project session for current directory
cd ~/code/myproject && tproject

# List all sessions and switch
tms

# Attach to existing or create new
tms myproject
```

## 🎨 Status Bar
The status bar shows:
- Session name
- Window list with current window highlighted
- Current pane title
- Date and time
- System information

## 💡 Tips
- Use `tms` without arguments to see all sessions
- `tcode` creates a split layout perfect for development
- Copy mode uses vi-style navigation
- Prefix + ? shows all key bindings
- Sessions persist even when terminal is closed
