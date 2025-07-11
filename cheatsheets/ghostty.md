# 👻 Ghostty Terminal Cheatsheet

Ghostty is a modern, fast terminal emulator built for performance and customization.

## 🚀 Quick Start
| Command | Action |
|---------|--------|
| `ghostty` | Launch Ghostty |
| `Alt + t` | Launch Ghostty (via Aerospace) |

## ⌨️ Default Keybindings
| Key Combination | Action |
|----------------|--------|
| `Cmd + T` | New tab |
| `Cmd + W` | Close tab |
| `Cmd + Shift + ]` | Next tab |
| `Cmd + Shift + [` | Previous tab |
| `Cmd + 1-9` | Switch to tab 1-9 |
| `Cmd + N` | New window |
| `Cmd + Shift + N` | New window (same directory) |

## 🪟 Window Management
| Key Combination | Action |
|----------------|--------|
| `Cmd + D` | Split pane horizontally |
| `Cmd + Shift + D` | Split pane vertically |
| `Cmd + Shift + W` | Close pane |
| `Cmd + [` | Previous pane |
| `Cmd + ]` | Next pane |
| `Cmd + Alt + Arrow` | Resize pane |

## 🔍 Search & Navigation
| Key Combination | Action |
|----------------|--------|
| `Cmd + F` | Search |
| `Cmd + G` | Find next |
| `Cmd + Shift + G` | Find previous |
| `Cmd + K` | Clear screen |
| `Cmd + L` | Clear scrollback |

## 📋 Copy & Paste
| Key Combination | Action |
|----------------|--------|
| `Cmd + C` | Copy |
| `Cmd + V` | Paste |
| `Cmd + Shift + C` | Copy (alternative) |
| `Cmd + Shift + V` | Paste (alternative) |

## 🎨 Appearance
| Key Combination | Action |
|----------------|--------|
| `Cmd + +` | Increase font size |
| `Cmd + -` | Decrease font size |
| `Cmd + 0` | Reset font size |
| `Cmd + Shift + F` | Toggle fullscreen |

## 🔧 Configuration File
Location: `~/.config/ghostty/config`

### Key Configuration Options
```ini
# Font settings
font-family = "JetBrains Mono"
font-size = 14

# Theme
theme = "catppuccin-mocha"

# Window settings
window-decoration = false
window-padding-x = 10
window-padding-y = 10

# Cursor
cursor-style = block
cursor-style-blink = false

# Shell integration
shell-integration = true
shell-integration-features = cursor,sudo,title

# Performance
sync-to-monitor = true
```

## 🎨 Themes
Popular themes available:
- `catppuccin-mocha`
- `catppuccin-macchiato`
- `catppuccin-frappe`
- `catppuccin-latte`
- `dracula`
- `nord`
- `gruvbox-dark`
- `gruvbox-light`
- `tokyo-night`

## 🔧 Advanced Features
| Feature | Description |
|---------|-------------|
| **GPU Acceleration** | Hardware-accelerated rendering |
| **Ligatures** | Programming font ligatures support |
| **True Color** | 24-bit color support |
| **Shell Integration** | Enhanced shell features |
| **Image Support** | Inline image display |
| **Hyperlinks** | Clickable URLs |

## 🚀 Performance Features
- **Metal/OpenGL rendering** for smooth scrolling
- **Minimal input latency** for responsive typing
- **Efficient memory usage** for large scrollbacks
- **Fast startup time** compared to other terminals

## 🔧 Configuration Examples
```ini
# Custom keybindings
keybind = cmd+shift+enter=new_window
keybind = cmd+shift+t=new_tab

# Mouse settings
mouse-hide-while-typing = true
copy-on-select = true

# Bell settings
audible-bell = false
visual-bell = true

# Scrollback
scrollback-limit = 10000

# Background
background-opacity = 0.95
background-blur-radius = 20
```

## 🎯 Integration with Other Tools
| Tool | Integration |
|------|-------------|
| **Tmux** | Full compatibility with tmux sessions |
| **Zsh** | Enhanced shell integration |
| **Neovim** | True color and font ligature support |
| **Aerospace** | Launches via `Alt + t` |

## 💡 Pro Tips
- Use `Cmd + D` for horizontal splits (like tmux)
- Shell integration provides better title updates
- GPU acceleration makes scrolling buttery smooth
- Supports all modern terminal features (true color, ligatures)
- Configuration hot-reloads without restart
- Works great with terminal multiplexers like tmux

## 🔧 Troubleshooting
| Issue | Solution |
|-------|----------|
| **Font not found** | Install font and restart Ghostty |
| **Colors look wrong** | Check `TERM` environment variable |
| **Slow performance** | Enable GPU acceleration in config |
| **Keybindings not working** | Check for conflicts with system shortcuts |

## 🌟 Why Ghostty?
- **Fast**: GPU-accelerated rendering
- **Modern**: Built with latest technologies
- **Customizable**: Extensive configuration options
- **Compatible**: Works with all terminal programs
- **Native**: Feels like a native macOS app
- **Open Source**: Actively developed and maintained

## 📁 Configuration Structure
```
~/.config/ghostty/
├── config              # Main configuration file
├── themes/            # Custom themes (optional)
└── keybindings/       # Custom keybindings (optional)
```

## 🔄 Updating Configuration
1. Edit `~/.config/ghostty/config`
2. Configuration reloads automatically
3. Some changes may require restart
4. Use `ghostty --validate-config` to check syntax
