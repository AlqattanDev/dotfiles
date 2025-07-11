# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Overview

This is a NvChad-based Neovim configuration that uses the **plugin architecture** (v2.5+). The main NvChad repository is used as a plugin, providing core functionality while allowing customization through this starter template.

## Architecture

### Core Structure
```
├── init.lua              # Entry point - bootstraps lazy.nvim and loads NvChad
├── lua/
│   ├── chadrc.lua       # Main configuration file for NvChad overrides
│   ├── mappings.lua     # Custom keybindings (extends nvchad.mappings)
│   ├── options.lua      # Neovim options (extends nvchad.options)
│   ├── autocmds.lua     # Auto commands
│   ├── plugins/init.lua # Plugin specifications and overrides
│   └── configs/         # Plugin configurations
└── lazy-lock.json       # Plugin version lock file
```

### Plugin System
- Uses **lazy.nvim** as the plugin manager
- **95% of plugins are lazy loaded** for performance
- NvChad core is loaded as a plugin (`NvChad/NvChad` v2.5 branch)
- Custom plugins are defined in `lua/plugins/init.lua`

### Key Concepts
- **Leader key**: Space (` `)
- **Theme system**: Base46 with 68+ built-in themes (currently using "rxyhn")
- **Lazy loading**: Plugins load on demand (events, commands, filetypes)
- **Override system**: User config overrides NvChad defaults through `chadrc.lua`

## Important Files

### `init.lua`
- Bootstraps lazy.nvim plugin manager
- Loads NvChad core plugin
- Imports user plugins from `plugins/` directory
- Loads theme cache and applies base configurations

### `lua/chadrc.lua`
- Main configuration override file
- Structure must match nvconfig.lua from NvChad/ui
- Contains theme selection and UI customizations
- Current theme: "rxyhn"

### `lua/plugins/init.lua`
- Defines additional plugins beyond NvChad defaults
- Current plugins include:
  - `conform.nvim` for code formatting
  - `nvim-lspconfig` for language server support
  - `mcphub.nvim` for MCP (Model Context Protocol) integration
  - `lualine.nvim` for enhanced statusline

## Custom Configuration

### Current Customizations
- **Theme**: Using "rxyhn" theme
- **Keybindings**: 
  - `;` mapped to `:` for command mode
  - `jk` mapped to `<ESC>` in insert mode
- **MCP Integration**: mcphub.nvim plugin with lualine extension
- **Lualine**: Custom statusline replacing default NvChad statusline

### Plugin Configuration Pattern
```lua
-- In lua/plugins/init.lua
{
  "plugin-name",
  event = "BufRead",  -- Lazy load trigger
  opts = require "configs.plugin-name",  -- Config in configs/ dir
}
```

## Development Workflow

### Common Commands in Neovim
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

### Theme Customization
- Change theme in `chadrc.lua` under `M.base46.theme`
- Override highlights using `hl_override` table
- Available themes: 68+ built-in options

### File Structure
- **Global config**: `lua/chadrc.lua`
- **Keybindings**: `lua/mappings.lua` 
- **Vim options**: `lua/options.lua`
- **Plugins**: `lua/plugins/init.lua`
- **Plugin configs**: `lua/configs/*.lua`

## Performance Notes

- Startup time: 0.02-0.07 seconds (extremely fast)
- Disabled built-in plugins for performance (see `configs/lazy.lua`)
- Lazy loading enabled by default for all plugins
- Theme cache system for faster UI rendering

## AI Integration

### GitHub Copilot & CopilotChat
This configuration includes AI-powered coding assistance:

**Plugins:**
- `github/copilot.vim` - AI code completion and suggestions
- `CopilotC-Nvim/CopilotChat.nvim` - AI chat for code explanation and review

**Keybindings (Conflict-Free):**
- `<C-y>` (insert mode) - Accept Copilot suggestion
- `<C-]>` (insert mode) - Next Copilot suggestion
- `<C-[>` (insert mode) - Previous Copilot suggestion
- `<leader>cc` - Toggle Copilot Chat
- `<leader>ce` - Explain selected code (visual mode)
- `<leader>cr` - Review selected code (visual mode)

**Setup Requirements:**
- GitHub Copilot subscription
- Run `:Copilot setup` on first use
- Authenticate with GitHub account

### MCP Integration

This configuration includes mcphub.nvim for Model Context Protocol support:
- Requires global `mcp-hub` installation (`npm install -g mcp-hub@latest`)
- Provides lualine integration showing MCP status
- Enables connecting Neovim to various MCP servers

## Documentation

Comprehensive documentation exists in the `docs/` directory covering:
- Architecture details
- Plugin management
- Keybinding customization
- Theme configuration
- Troubleshooting guides