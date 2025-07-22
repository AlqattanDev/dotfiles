# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Overview

This is a NvChad-based Neovim configuration that uses the **plugin architecture** (v2.5+). The main NvChad repository is used as a plugin, providing core functionality while allowing customization through this starter template.

## Architecture

### Directory Structure
```
├── init.lua              # Entry point - bootstraps lazy.nvim and loads NvChad
├── lazy-lock.json        # Plugin version lock file
├── lua/
│   ├── chadrc.lua       # Main configuration file for NvChad overrides
│   ├── mappings.lua     # Custom keybindings (extends nvchad.mappings)
│   ├── options.lua      # Neovim options (extends nvchad.options)
│   ├── autocmds.lua     # Auto commands
│   ├── plugins/
│   │   └── init.lua     # Plugin specifications and overrides
│   └── configs/         # Plugin-specific configurations
│       ├── avante.lua   # Avante AI assistant config
│       ├── conform.lua  # Code formatting config
│       ├── flutter-tools.lua # Flutter development config
│       ├── lazy.lua     # Lazy.nvim config
│       ├── lspconfig.lua # Language server config
│       ├── nvim-tree.lua # File explorer config
│       └── ui-demos.lua # UI demonstrations
├── docs/                # Comprehensive documentation
│   ├── README.md
│   ├── architecture.md
│   ├── configuration/
│   ├── features/
│   ├── guides/
│   ├── keybindings/
│   ├── plugins/
│   └── theming/
├── LICENSE
└── README.md
```

### Plugin System
- Uses **lazy.nvim** as the plugin manager
- **95% of plugins are lazy loaded** for performance
- NvChad core is loaded as a plugin (`NvChad/NvChad` v2.5 branch)
- Custom plugins are defined in `lua/plugins/init.lua`
- **Blink Cmp**: Uses modern `blink.cmp` completion system via `nvchad.blink.lazyspec`

### Key Concepts
- **Leader key**: Space (` `)
- **Theme system**: Base46 with 68+ built-in themes (currently using "doomchad")
- **Lazy loading**: Plugins load on demand (events, commands, filetypes)
- **Override system**: User config overrides NvChad defaults through `chadrc.lua`

## Important Files

### `init.lua`
- Bootstraps lazy.nvim plugin manager from GitHub
- Loads NvChad core plugin (v2.5 branch)
- Imports user plugins from `plugins/` directory
- Loads theme cache and applies base configurations
- Sets leader key to Space
- Schedules mapping loading for optimal performance

### `lua/chadrc.lua`
- Main configuration override file
- Structure must match nvconfig.lua from NvChad/ui
- Contains theme selection and UI customizations
- **Current theme**: "doomchad"
- Commented sections for nvdash and tabufline customization

### `lua/plugins/init.lua`
Current plugin ecosystem includes:

**Core Plugins:**
- `nvchad.blink.lazyspec` - Modern completion engine
- `christoomey/vim-tmux-navigator` - Seamless tmux/nvim navigation

**AI & Development:**
- `ravitemer/mcphub.nvim` - Model Context Protocol integration
- `nvim-lualine/lualine.nvim` - Enhanced statusline with MCP status
- `zbirenbaum/copilot.lua` - GitHub Copilot integration
- `yetone/avante.nvim` - AI coding assistant with slash commands

**Flutter Development:**
- `nvim-flutter/flutter-tools.nvim` - Complete Flutter development suite

**Additional Dependencies:**
- `stevearc/dressing.nvim` - Enhanced UI components
- `HakonHarnes/img-clip.nvim` - Image pasting support
- `MeanderingProgrammer/render-markdown.nvim` - Markdown rendering

## Current Configuration Details

### Theme Configuration
- **Active theme**: "doomchad" (set in `lua/chadrc.lua:9`)
- Theme overrides for comments are available but commented out
- Base46 theme system with 68+ built-in options

### Keybindings (`lua/mappings.lua`)
**Core mappings:**
- `;` → `:` (command mode shortcut)
- `jk` → `<ESC>` (insert mode escape)

**Copilot controls:**
- `<leader>cp` - Open Copilot panel
- `<leader>cs` - Copilot status
- `<leader>ce` - Enable Copilot
- `<leader>cd` - Disable Copilot

**Flutter development:**
- `<leader>fr` - Flutter Run
- `<leader>fq` - Flutter Quit
- `<leader>fR` - Flutter Restart
- `<leader>fh` - Flutter Hot Reload

**Tmux navigation:**
- `<C-h/j/k/l>` - Navigate between tmux/nvim panes
- `<C-\>` - Previous tmux/nvim pane

### Vim Options (`lua/options.lua`)
- Loads NvChad defaults
- Minimal custom options (cursorline example commented)
- Clean, performance-focused configuration

## AI Integration

### Avante.nvim - Advanced AI Assistant
**Configuration highlights (`lua/configs/avante.lua`):**
- **Provider**: GitHub Copilot (gpt-4o-2024-08-06 model)
- **Auto-suggestions**: Enabled with intelligent diff application
- **UI**: Right sidebar (35% width) with rounded headers
- **Clipboard support**: Paste from clipboard enabled
- **Image support**: Via img-clip.nvim integration

**Key mappings:**
- Diff navigation: `]x`/`[x` (next/prev), `co`/`ct`/`ca`/`cb`/`cc` (conflict resolution)
- Suggestions: `<M-l>` (accept), `<M-]>`/`<M-[>` (next/prev), `<C-]>` (dismiss)
- Sidebar: `<Tab>` (switch windows), `A`/`a` (apply all/cursor)

### GitHub Copilot Integration
- **Plugin**: `zbirenbaum/copilot.lua` for better Avante integration
- **Features**: Enhanced suggestions (5 list items, 3 inline)
- **Settings**: Optimized for AI-assisted development workflow

### MCP (Model Context Protocol)
- **Plugin**: `ravitemer/mcphub.nvim` with Lualine integration
- **Auto-installation**: Local mcp-hub installation if not globally available
- **Status display**: MCP connection status in statusline
- **Integration**: Seamless connection to various MCP servers

## Flutter Development

### Flutter Tools Configuration (`lua/configs/flutter-tools.lua`)
**Features:**
- **UI**: Rounded borders with nvim-notify integration
- **Statusline**: Device info display, version info disabled
- **Widget guides**: Enabled for better widget tree visualization
- **Closing tags**: Enabled with error highlighting
- **Dev tools**: Manual start (autostart disabled)
- **LSP integration**: Full Dart LSP with color support
- **Analysis**: Excludes common cache directories
- **Snippets**: Enabled with import updates on rename

## Performance Optimizations

### Lazy Loading Strategy
- **Tmux navigator**: Loaded immediately for seamless navigation
- **Lualine**: VeryLazy loading for statusline
- **Avante**: VeryLazy loading with build step
- **Flutter tools**: Filetype-specific loading (`.dart` files)
- **Copilot**: Insert mode and command-based loading

### Startup Performance
- Lazy.nvim bootstrap with automatic installation
- Theme cache system for instant UI rendering
- Scheduled mapping loading to prevent startup delays
- Optimized plugin dependency management

## Development Workflow

### Common Commands
- `:NvCheatsheet` - View all keybindings
- `:Lazy` - Open plugin manager
- `:Lazy sync` - Update all plugins
- `<Space>th` - Change theme
- `<Space>ff` - Find files (telescope)
- `<Ctrl>n` - Toggle file tree

### Plugin Management
- Add new plugins in `lua/plugins/init.lua`
- Plugin configurations go in `lua/configs/`
- Use lazy loading by default (`lazy = true`)
- Check `lazy-lock.json` for pinned versions
- Build steps for plugins requiring compilation

### Available Configurations
Current `lua/configs/` directory contains:
- `avante.lua` - AI assistant configuration
- `conform.lua` - Code formatting (commented out)
- `flutter-tools.lua` - Flutter development setup
- `lazy.lua` - Plugin manager configuration
- `lspconfig.lua` - Language server setup (commented out)
- `nvim-tree.lua` - File explorer configuration
- `ui-demos.lua` - UI component demonstrations

## Directory Access & Structure

### Primary Configuration Locations

**Main Config Directory:**
- `/Users/alialqattan/dotfiles/nvim/` - Your custom NvChad configuration
- `/Users/alialqattan/.config/nvim/` - Symlinked to dotfiles (same content)

**Data & Cache Directories:**
- `/Users/alialqattan/.local/share/nvim/` - Plugin installations and data
  - `lazy/` - All lazy.nvim managed plugins
  - `base46/` - Theme cache files for instant UI loading
  - `mason/` - LSP servers, formatters, linters installed via Mason
  - `blink/cmp/` - Completion engine database
  - `avante/` - AI assistant data and configurations

### NvChad Core Location

**Default NvChad Files:**
- `/Users/alialqattan/.local/share/nvim/lazy/NvChad/` - Core NvChad plugin
- `/Users/alialqattan/.local/share/nvim/lazy/ui/` - NvChad UI components and themes
  - `lua/nvconfig.lua` - Default configuration structure template
  - `colors/nvchad.lua` - Default colorscheme
  - `nvchad_types/` - TypeScript-like definitions for configuration

### Plugin Ecosystem Locations

**Installed Plugins in `/Users/alialqattan/.local/share/nvim/lazy/`:**

**Core Infrastructure:**
- `lazy.nvim/` - Plugin manager
- `base46/` - Theme engine
- `ui/` - NvChad UI framework

**Language Support:**
- `nvim-lspconfig/` - Language server configurations (220+ servers)
- `mason.nvim/` - Package manager for LSP/DAP/linters/formatters
- `nvim-treesitter/` - Syntax highlighting and parsing
- `LuaSnip/` - Snippet engine
- `friendly-snippets/` - Snippet collection

**AI Integration:**
- `avante.nvim/` - Advanced AI coding assistant
- `copilot.lua/` - GitHub Copilot integration
- `blink.cmp/` - Modern completion engine

**Development Tools:**
- `flutter-tools.nvim/` - Flutter development suite
- `conform.nvim/` - Code formatting
- `gitsigns.nvim/` - Git integration
- `telescope.nvim/` - Fuzzy finder

**UI Enhancement:**
- `lualine.nvim/` - Statusline
- `nvim-tree.lua/` - File explorer
- `which-key.nvim/` - Keybinding hints
- `indent-blankline.nvim/` - Indentation guides

**Utility:**
- `plenary.nvim/` - Lua utility library
- `dressing.nvim/` - UI improvements
- `nvim-autopairs/` - Auto-closing brackets
- `vim-tmux-navigator/` - Tmux integration

### Theme System Structure

**Base46 Cache Location:**
`/Users/alialqattan/.local/share/nvim/base46/` contains:
- `defaults` - Base theme settings
- `statusline` - Statusline colors
- `colors` - Color definitions
- `syntax` - Syntax highlighting
- `treesitter` - Treesitter colors
- `telescope` - Telescope UI colors
- `nvimtree` - File explorer colors
- Additional component-specific theme files

### Documentation Structure

The `docs/` directory provides comprehensive coverage:
- **Architecture**: System design and plugin architecture  
- **Configuration**: Setup guides and customization options
- **Features**: Detailed feature explanations
- **Guides**: Step-by-step tutorials
- **Keybindings**: Complete mapping reference with customization
- **Plugins**: Plugin management and examples
- **Theming**: Theme system and customization options

### Performance & Data Management

**Cache Optimization:**
- Theme cache files in `base46/` for instant UI loading
- Blink completion database for fast completions
- Lazy.nvim plugin lazy-loading system

**Plugin Versioning:**
- `lazy-lock.json` - Exact plugin commit hashes for reproducibility
- Individual plugin directories maintain their own version control