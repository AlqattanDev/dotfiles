# 🐚 Zsh Configuration Cheatsheet

Optimized Zsh configuration with Oh My Zsh, custom aliases, and productivity functions.

## 🚀 Navigation Aliases
| Alias | Command | Description |
|-------|---------|-------------|
| `..` | `cd ..` | Go up one directory |
| `...` | `cd ../..` | Go up two directories |
| `....` | `cd ../../..` | Go up three directories |
| `.....` | `cd ../../../..` | Go up four directories |
| `......` | `cd ../../../../..` | Go up five directories |
| `z` | `cd` | Change directory |
| `cl` | `clear` | Clear terminal |

## 📁 File Management
| Alias | Command | Description |
|-------|---------|-------------|
| `ll` | `ls -lAh` | Long list with human readable sizes |
| `lr` | `ls -lAhrt` | List by time, newest last |
| `cat` | `bat --plain --paging=never` | Enhanced cat with syntax highlighting |
| `md` | `mkdir -p` | Create directory and parents |
| `rd` | `rmdir` | Remove directory |
| `pwdy` | `pwd \| pbcopy` | Copy current path to clipboard |

## 🔧 Development Tools
| Alias | Command | Description |
|-------|---------|-------------|
| `v` | `nvim` | Open Neovim |
| `vim` | `nvim` | Open Neovim |
| `lg` | `lazygit` | Open Lazygit |
| `nvc` | `cd ~/.config/nvim && nvim` | Edit Neovim config |

## 📝 Git Workflow
| Alias | Command | Description |
|-------|---------|-------------|
| `gits` | `git status --short --branch` | Short git status |
| `gita` | `git add --update` | Add updated files |
| `gitp` | `git push` | Push to remote |
| `gitc` | `aicommits` | AI-powered commits |

### Git Functions
| Function | Description |
|----------|-------------|
| `gitm "message"` | Commit with message |
| `gitu` | Quick commit with timestamp |
| `gitq` | Add, commit with timestamp, and push |

## 🐍 Python Environment
| Alias | Command | Description |
|-------|---------|-------------|
| `python3.12` | `/opt/homebrew/bin/python3.12` | Python 3.12 |
| `pip3.12` | `/opt/homebrew/bin/pip3.12` | Pip for Python 3.12 |
| `pyv` | `~/virtualenvs/adhoc/bin/python` | Virtual env Python |
| `piv` | `~/virtualenvs/adhoc/bin/pip` | Virtual env Pip |
| `jn` | `jupyter notebook` | Start Jupyter notebook |
| `jc` | `jupyter console` | Start Jupyter console |

## 📺 Tmux Integration
| Alias | Command | Description |
|-------|---------|-------------|
| `t` | `tmux` | Start tmux |
| `ta` | `tmux attach` | Attach to session |
| `tls` | `tmux list-sessions` | List sessions |
| `tn` | `tmux new-session` | New session |
| `tk` | `tmux kill-session` | Kill session |
| `tma` | `tmux attach -t` | Attach to named session |
| `tmn` | `tmux new-session -s` | New named session |
| `tml` | `tmux list-sessions` | List sessions |
| `tmk` | `tmux kill-session -t` | Kill named session |

### Tmux Functions
| Function | Description |
|----------|-------------|
| `tms` | List sessions or switch to session |
| `tms <name>` | Switch to or create session |

## 🎯 Project Shortcuts
| Alias | Command | Description |
|-------|---------|-------------|
| `zc` | `cd ~/pro/zazencodes-season-2/src` | ZazenCodes project |
| `oo` | Navigate to Obsidian vault | Obsidian notes |
| `or` | Edit Obsidian inbox | Quick notes |
| `ou` | Upload to Notion | Sync notes |
| `komo` | Komorebi Art Gallery | Art project |

## 🤖 AI Tools
| Alias | Command | Description |
|-------|---------|-------------|
| `claude` | `/Users/alialqattan/.claude/local/claude` | Claude CLI |
| `taskmaster` | `task-master` | Task management |
| `llm_deepseek` | `llm -m deepseek-r1:8b` | DeepSeek model |
| `llm_cat_dir` | List and show all files | Directory overview |

## 🔧 Utility Functions
| Function | Description |
|----------|-------------|
| `nn <filename>` | Create and open note in Downloads |
| `lsg` | List files with git status |
| `mkproject <name>` | Create project with git repo |

## 🛣️ PATH Management
The configuration includes optimized PATH management:
- `/opt/homebrew/bin` (Homebrew)
- `~/bin` (Personal scripts)
- `~/.local/bin` (Local binaries)
- `~/go/bin` (Go binaries)
- `~/.bun/bin` (Bun runtime)
- Android SDK tools

## 📦 Package Managers
| Tool | Configuration |
|------|---------------|
| **NVM** | Lazy loaded for performance |
| **Conda** | Auto-initialized |
| **Bun** | Runtime configured |

## 🎨 Theme & Plugins
- **Theme**: robbyrussell (fast and clean)
- **Plugins**: git, colored-man-pages, colorize, python, macos

## 🔧 Performance Features
- Skip global compinit for faster startup
- Lazy loading for package managers
- Efficient PATH deduplication
- Optimized plugin selection

## 💡 Custom Functions Examples
```bash
# Create a new project
mkproject myapp
# Creates directory, initializes git, creates README

# Quick git workflow
gitq
# Adds updated files, commits with timestamp, pushes

# Smart directory listing with git info
lsg
# Shows files and git status if in a repo

# Quick note creation
nn "meeting-notes.md"
# Creates and opens file in Downloads
```

## 🌍 Environment Variables
- `VISUAL=nvim` - Default visual editor
- `EDITOR=mate -w` - Default editor
- `LANG=en_US.UTF-8` - Locale settings
- XDG Base Directory compliance

## 💡 Tips
- Use `..` through `......` for quick navigation
- `gitq` is perfect for quick commits
- `tms` without args shows all tmux sessions
- All configs are optimized for speed
- Functions are designed for common workflows
