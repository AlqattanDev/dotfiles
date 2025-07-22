# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration built on the LazyVim starter template with extensive AI integration. The setup emphasizes modern development workflows, AI-assisted coding, and language-specific tooling across TypeScript, Python, Rust, Go, and Flutter.

## Architecture

### Core Bootstrap System
- `init.lua` - Minimal entry point that loads lazy configuration
- `lua/config/lazy.lua` - Plugin manager bootstrap with auto-installation of lazy.nvim
- `lazy-lock.json` - Version lockfile ensuring reproducible plugin states
- `lazyvim.json` - LazyVim extras configuration defining enabled language/feature modules

### Plugin Organization
The configuration follows LazyVim's modular architecture:
- **Core imports**: `import = "lazyvim.plugins"` provides base functionality
- **Extras system**: Language and feature modules loaded via `lazyvim.json`
- **Custom plugins**: Located in `lua/plugins/` directory with clear naming conventions
- **Inheritance pattern**: Config files inherit LazyVim defaults and add customizations

### AI Integration Layer
Multiple AI providers are configured for enhanced coding experience:
- **Avante.nvim** - Claude Sonnet 4 integration with custom parameters
- **GitHub Copilot** - Code completion and chat functionality
- **Supermaven** - Additional AI completion provider
- **MCP Hub** - Model Context Protocol integration requiring Node.js

### Language Support Matrix
Active language configurations include:
- **TypeScript/JavaScript** - Enhanced with typescript.nvim
- **Python** - Pyright LSP with flake8 linting
- **Rust** - Crates.nvim for Cargo.toml management
- **Flutter/Dart** - Dedicated flutter-tools.nvim setup
- **Go, Svelte, JSON, Markdown, TOML** - Via LazyVim extras

## Key Configuration Patterns

### Plugin Specification Approaches
```lua
-- Simple option override
{ "plugin/name", opts = { setting = value } }

-- Function-based for complex logic
{ 
  "plugin/name", 
  opts = function(_, opts)
    table.insert(opts.sources, { name = "new_source" })
  end
}

-- LSP server registration
{
  "neovim/nvim-lspconfig",
  opts = {
    servers = { server_name = {} },
    setup = { server_name = function(_, opts) return true end }
  }
}
```

### Extending vs Overriding
- Use `vim.list_extend()` for extending arrays (ensure_installed, sources)
- Use table merge for simple option overrides
- Function-based `opts` for complex configuration logic
- `setup` functions for custom LSP configurations

## Development Commands

### Code Formatting
```bash
stylua . --config-path stylua.toml
```
Configuration: 2-space indentation, 120 character line width

### Plugin Management
```vim
:Lazy                    " Open plugin manager UI
:Lazy update            " Update all plugins  
:Lazy sync              " Install missing and update existing
:Lazy clean             " Remove unused plugins
:Lazy profile           " Profile startup time
:LazyExtras             " Manage LazyVim extras
:LazyHealth             " Check configuration health
```

### AI Integration Setup
```bash
npm install -g mcp-hub@latest  # Required for MCP Hub functionality
```

## Development Workflow

### Adding New Plugins
1. Create descriptive file in `lua/plugins/` (e.g., `editor.lua`, `ui.lua`)
2. Return table/array of plugin specifications
3. Use LazyVim extras when available: `{ import = "lazyvim.plugins.extras.lang.typescript" }`
4. Test incrementally and restart Neovim after changes

### Language Support Extensions
- Check `lazyvim.json` for currently enabled extras
- Add language support via LazyVim extras rather than custom configurations
- LSP servers configured through `nvim-lspconfig` plugin specs, not separate files
- Mason automatically manages tool installation

### Configuration Patterns
- **Inheritance-first**: Core config files inherit LazyVim defaults, add customizations
- **Modular plugins**: Group related plugins in descriptive files
- **Performance-aware**: Use `lazy = true` and appropriate loading triggers
- **Keymap integration**: Define keymaps in plugin specs using `keys` table

### Troubleshooting Workflow
1. `:LazyHealth` - Check configuration health
2. `:Lazy profile` - Identify slow plugins
3. `:checkhealth` - Neovim built-in health checks
4. Check `lazy-lock.json` for plugin version conflicts

## File Conventions
- All Lua files: 2-space indentation, 120 character line width
- Plugin files: Return table or array of plugin specifications
- Descriptive naming: `editor.lua`, `ui.lua`, `lsp.lua`
- Related grouping: Keep related plugins in same file when logical
- Comments: Use for complex configurations, avoid for obvious settings