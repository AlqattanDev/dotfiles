# ⚡ Neovim Configuration Cheatsheet

Advanced Neovim setup with NvChad base, custom plugins, and AI integration.

## 🚀 Quick Start
| Command | Action |
|---------|--------|
| `v` or `vim` | Open Neovim |
| `nvc` | Edit Neovim config |
| `nvim .` | Open current directory |

## 🗂️ File Management
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer (NvimTree) |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help tags |
| `<leader>fo` | Find old files |

## 🧭 Navigation
| Key | Action |
|-----|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to bottom window |
| `<C-k>` | Move to top window |
| `<C-l>` | Move to right window |
| `<leader>x` | Close current buffer |
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |

## 📝 Editing
| Key | Action |
|-----|--------|
| `<leader>fm` | Format current file |
| `<leader>/` | Toggle comment |
| `<leader>h` | Clear search highlights |
| `<C-s>` | Save file |
| `<C-c>` | Copy to system clipboard |
| `<C-v>` | Paste from system clipboard |

## 🔍 Search & Replace
| Key | Action |
|-----|--------|
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next search result |
| `N` | Previous search result |
| `:%s/old/new/g` | Replace all occurrences |
| `:%s/old/new/gc` | Replace with confirmation |

## 🎨 LSP (Language Server Protocol)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Show hover information |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>q` | Open diagnostic list |

## 🤖 AI Integration (Avante)
| Key | Action |
|-----|--------|
| `<leader>aa` | Toggle Avante |
| `<leader>ar` | Refresh Avante |
| `<leader>ae` | Edit with Avante |

## 🔧 Terminal
| Key | Action |
|-----|--------|
| `<A-i>` | Toggle floating terminal |
| `<A-h>` | Toggle horizontal terminal |
| `<A-v>` | Toggle vertical terminal |

## 📦 Plugin Management (Lazy)
| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager |
| `:Lazy update` | Update all plugins |
| `:Lazy sync` | Sync plugins |
| `:Lazy clean` | Remove unused plugins |

## 🎯 NvimTree (File Explorer)
| Key | Action |
|-----|--------|
| `<CR>` | Open file/folder |
| `o` | Open file/folder |
| `<C-]>` | CD into directory |
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `a` | Create new file/folder |
| `d` | Delete file/folder |
| `r` | Rename file/folder |
| `x` | Cut file/folder |
| `c` | Copy file/folder |
| `p` | Paste file/folder |
| `R` | Refresh tree |
| `H` | Toggle hidden files |

## 🔭 Telescope (Fuzzy Finder)
| Key | Action |
|-----|--------|
| `<C-n>` | Next item |
| `<C-p>` | Previous item |
| `<C-c>` | Close telescope |
| `<CR>` | Select item |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `<C-t>` | Open in new tab |
| `<C-u>` | Scroll up preview |
| `<C-d>` | Scroll down preview |

## 🎨 Themes & UI
| Command | Action |
|---------|--------|
| `:Telescope colorscheme` | Change colorscheme |
| `:NvChadUpdate` | Update NvChad |

## 🔧 Configuration Files
```
~/.config/nvim/
├── init.lua              # Main config entry point
├── lua/
│   ├── chadrc.lua       # NvChad configuration
│   ├── options.lua      # Neovim options
│   ├── mappings.lua     # Key mappings
│   ├── autocmds.lua     # Auto commands
│   ├── configs/         # Plugin configurations
│   └── plugins/         # Plugin definitions
```

## 🚀 Custom Plugins Included
- **Avante**: AI-powered coding assistant
- **Flutter Tools**: Flutter development
- **Conform**: Code formatting
- **NvimTree**: File explorer
- **Telescope**: Fuzzy finder
- **LSP**: Language server support

## 💡 Workflow Tips
```bash
# Open project in Neovim
cd ~/myproject && nvim .

# Quick file navigation
<leader>ff  # Find files
<leader>fg  # Search in files
<leader>e   # Toggle file tree

# Code editing workflow
gd          # Go to definition
<leader>ca  # Code actions
<leader>fm  # Format code
<leader>/   # Comment/uncomment

# AI assistance
<leader>aa  # Toggle Avante for AI help
```

## 🎯 Language Support
Configured LSP servers for:
- **Lua** - Neovim configuration
- **Python** - Data science & web dev
- **JavaScript/TypeScript** - Web development
- **Dart/Flutter** - Mobile development
- **Go** - Backend development
- **Rust** - Systems programming
- **And many more...**

## 🔧 Formatting
Auto-formatting configured for:
- Prettier (JS/TS/JSON/CSS/HTML)
- Black (Python)
- Stylua (Lua)
- Gofmt (Go)
- Rustfmt (Rust)

## 💡 Pro Tips
- Use `<leader>ff` for quick file switching
- `<leader>fg` searches across entire project
- LSP provides intelligent code completion
- Avante AI can help with code generation
- NvimTree shows git status in file explorer
- Telescope previews files before opening
- All keybindings are optimized for speed

## 🎨 Customization
- Base: NvChad for beautiful UI
- Theme: Customizable through `:Telescope colorscheme`
- Plugins: Managed with Lazy.nvim
- LSP: Automatic server installation
- AI: Integrated Avante for coding assistance
