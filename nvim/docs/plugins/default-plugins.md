# NvChad Default Plugins

Complete reference of all plugins included with NvChad by default.

## 🎯 Core System Plugins

### NvChad/base46
- **Purpose**: Theme system and color management
- **Features**: 68+ themes, highlight overrides, transparency
- **Loading**: Immediate (lazy = false)
- **Configuration**: Through `chadrc.lua`

### NvChad/ui  
- **Purpose**: UI components (statusline, tabufline, dashboard)
- **Features**: Statusline, buffer tabs, NvDash, cheatsheet
- **Loading**: Immediate (lazy = false)
- **Configuration**: Through `nvconfig.lua`

### folke/lazy.nvim
- **Purpose**: Plugin manager
- **Features**: Lazy loading, dependency management, UI
- **Loading**: Bootstrap (required for system)
- **Configuration**: In `configs/lazy.lua`

## 🔤 Language Support Plugins

### neovim/nvim-lspconfig
- **Purpose**: LSP client configuration
- **Features**: Language server setup, diagnostics, completion
- **Loading**: Lazy (on LSP attach)
- **Configuration**: `configs/lspconfig.lua`
- **Commands**: `:LspInfo`, `:LspStart`, `:LspStop`

### nvim-treesitter/nvim-treesitter
- **Purpose**: Syntax highlighting and parsing
- **Features**: Better syntax highlighting, code folding, selection
- **Loading**: Lazy (on file read)
- **Configuration**: Auto-configured for common languages
- **Commands**: `:TSInstall`, `:TSUpdate`, `:TSPlayground`

### williamboman/mason.nvim
- **Purpose**: LSP/DAP/Linter package manager
- **Features**: Install language servers, formatters, linters
- **Loading**: Lazy (on command)
- **Configuration**: Auto-configured with common tools
- **Commands**: `:Mason`, `:MasonInstall`, `:MasonUninstall`

## 📁 File Management Plugins

### nvim-tree/nvim-tree.lua
- **Purpose**: File explorer sidebar
- **Features**: Tree view, file operations, Git integration
- **Loading**: Lazy (on toggle command)
- **Keybinding**: `<Ctrl>n` to toggle
- **Configuration**: Default tree settings

### nvim-telescope/telescope.nvim
- **Purpose**: Fuzzy finder and picker
- **Features**: Find files, grep, buffers, commands
- **Loading**: Lazy (on command)
- **Keybindings**: 
  - `<leader>ff` - Find files
  - `<leader>fg` - Live grep
  - `<leader>fb` - Buffers
- **Dependencies**: `plenary.nvim`, `telescope-fzf-native.nvim`

## 🎨 Git Integration Plugins

### lewis6991/gitsigns.nvim
- **Purpose**: Git decorations and operations
- **Features**: Line signs, blame, hunk operations
- **Loading**: Lazy (on git repository)
- **Configuration**: Auto-configured for common use
- **Commands**: `:Gitsigns toggle_*`, `:Gitsigns blame_line`

## ✏️ Editing Enhancement Plugins

### hrsh7th/nvim-cmp
- **Purpose**: Autocompletion engine
- **Features**: LSP completion, snippet completion, buffer completion
- **Loading**: Lazy (on insert mode)
- **Configuration**: Pre-configured with common sources
- **Dependencies**: Various completion sources

### L3MON4D3/LuaSnip
- **Purpose**: Snippet engine
- **Features**: Snippet expansion, snippet navigation
- **Loading**: Lazy (with nvim-cmp)
- **Configuration**: Basic snippets included
- **Integration**: Works with nvim-cmp

### windwp/nvim-autopairs
- **Purpose**: Auto-close brackets and quotes
- **Features**: Smart pair completion, fast wrap
- **Loading**: Lazy (on insert mode)
- **Configuration**: Basic autopairs for common characters
- **Integration**: Works with nvim-cmp

## 🎛️ UI Enhancement Plugins

### folke/which-key.nvim
- **Purpose**: Keybinding help and documentation
- **Features**: Popup help, keybinding groups, timeout
- **Loading**: Lazy (on keypress)
- **Configuration**: Auto-configured with NvChad mappings
- **Trigger**: Appears after keypress delay

### nvim-lua/plenary.nvim
- **Purpose**: Utility functions for other plugins
- **Features**: Async, functional programming, testing
- **Loading**: Dependency (loaded when needed)
- **Configuration**: No direct configuration needed
- **Note**: Required by many other plugins

## 🔧 Utility Plugins

### stevearc/conform.nvim
- **Purpose**: Code formatting
- **Features**: Format on save, multiple formatters
- **Loading**: Lazy (on format command)
- **Configuration**: `configs/conform.lua`
- **Commands**: `:ConformInfo`, `:Format`

### nvim-tree/nvim-web-devicons
- **Purpose**: File type icons
- **Features**: Icons for files, folders, extensions
- **Loading**: Dependency (loaded when needed)
- **Configuration**: Auto-configured with theme
- **Integration**: Used by nvim-tree, telescope, etc.

## 🚀 Performance Plugins

### Disabled Built-in Plugins
NvChad disables many built-in Vim plugins for performance:
- **netrw**: Replaced by nvim-tree
- **gzip/tar/zip**: Archive handling
- **2html**: HTML conversion
- **tutor**: Vim tutorial
- **matchit**: Bracket matching
- **syntax**: Traditional syntax highlighting

## 📊 Plugin Loading Summary

### Immediate Loading (lazy = false)
- `NvChad/base46` - Theme system
- `NvChad/ui` - UI components  
- `lazy.nvim` - Plugin manager

### Event-Based Loading
- `nvim-treesitter` - On BufRead
- `gitsigns.nvim` - On Git repository detection
- `nvim-cmp` - On InsertEnter

### Command-Based Loading
- `nvim-tree` - On toggle command
- `telescope.nvim` - On telescope commands
- `mason.nvim` - On Mason commands

### Filetype-Based Loading
- `lspconfig` - On LSP-supported filetypes
- Various language-specific plugins

## 🔍 Plugin Dependencies

### Dependency Tree
```
lazy.nvim (root)
├── base46 (theme system)
├── ui (interface)
├── telescope
│   ├── plenary.nvim
│   └── telescope-fzf-native.nvim
├── nvim-cmp
│   ├── LuaSnip
│   ├── cmp-nvim-lsp
│   ├── cmp-buffer
│   └── cmp-path
├── nvim-tree
│   └── nvim-web-devicons
└── treesitter (standalone)
```

## 🛠️ Plugin Status Commands

### Health Checks
```vim
:checkhealth lazy       " Plugin manager health
:checkhealth nvim-cmp   " Completion health
:checkhealth mason      " LSP installer health
:checkhealth telescope  " Telescope health
:checkhealth treesitter " Syntax health
```

### Information Commands
```vim
:Lazy profile          " Startup profiling
:Mason                " LSP package manager
:TSInstallInfo        " Treesitter languages
:LspInfo             " LSP server status
```

---

*This comprehensive plugin suite provides a complete development environment while maintaining fast startup times through intelligent lazy loading.*