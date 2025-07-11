# 🚀 Aerospace Cheatsheet

Aerospace is a tiling window manager for macOS with Hyprland-style keybindings.

## 🎯 Window Navigation
| Key Combination | Action |
|----------------|--------|
| `Alt + h` | Focus window left |
| `Alt + j` | Focus window down |
| `Alt + k` | Focus window up |
| `Alt + l` | Focus window right |

## 🔄 Window Movement
| Key Combination | Action |
|----------------|--------|
| `Alt + Shift + h` | Move window left |
| `Alt + Shift + j` | Move window down |
| `Alt + Shift + k` | Move window up |
| `Alt + Shift + l` | Move window right |

## 📐 Window Resizing
| Key Combination | Action |
|----------------|--------|
| `Alt + -` | Resize smart (decrease) |
| `Alt + =` | Resize smart (increase) |
| `Alt + Ctrl + h` | Decrease width |
| `Alt + Ctrl + j` | Increase height |
| `Alt + Ctrl + k` | Decrease height |
| `Alt + Ctrl + l` | Increase width |

## 🏢 Workspace Management
| Key Combination | Action |
|----------------|--------|
| `Alt + 1-9` | Switch to workspace 1-9 |
| `Alt + Shift + 1-9` | Move window to workspace 1-9 |
| `Alt + Tab` | Switch between recent workspaces |
| `Alt + Shift + Tab` | Move workspace to next monitor |

## 🎮 Window Controls
| Key Combination | Action |
|----------------|--------|
| `Alt + q` | Close current window |
| `Alt + f` | Toggle fullscreen |
| `Alt + t` | Open terminal (Ghostty) |
| `Alt + b` | Open browser (Dia) |

## 🔧 Layout Management
| Key Combination | Action |
|----------------|--------|
| `Alt + /` | Toggle tile orientation |
| `Alt + ,` | Switch to accordion layout |

## ⚙️ Service Mode
| Key Combination | Action |
|----------------|--------|
| `Alt + Shift + ;` | Enter service mode |

### Service Mode Commands
| Key | Action |
|-----|--------|
| `Esc` | Reload config and exit service mode |
| `r` | Reset layout (flatten workspace tree) |
| `f` | Toggle floating/tiling |
| `Backspace` | Close all windows except current |
| `Alt + Shift + h/j/k/l` | Join windows in direction |

## 🏠 Workspace Assignments
- **Workspace 1**: Browsers (Dia, Safari, Firefox)
- **Workspace 2**: Code editors (VSCode, Atom)
- **Workspace 3**: Terminals (Ghostty, Terminal, Kitty)
- **Workspace 4**: Communication (Slack, Teams)
- **Workspace 9**: Music (Apple Music, Spotify)

## 🔧 Configuration Commands
```bash
# Reload configuration
aerospace reload-config

# List all windows
aerospace list-windows --all

# List monitors
aerospace list-monitors

# Focus specific window
aerospace focus left/right/up/down

# Move window
aerospace move left/right/up/down
```

## 💡 Tips
- Hold `Alt` and use vim-style navigation (hjkl)
- Use `Alt + Shift` for moving windows
- Service mode (`Alt + Shift + ;`) for advanced operations
- Workspaces auto-assign apps based on type
- Mouse follows focus automatically
