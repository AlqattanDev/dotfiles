# NvChad Architecture

Understanding the core architecture and design principles that make NvChad blazing fast and highly customizable.

## 🏗️ Core Philosophy

NvChad was designed with several key principles in mind:

- **Performance First**: Optimized for speed with lazy loading
- **Beautiful UI**: Consistent, modern interface
- **Lightweight**: Minimal resource usage (~900 lines of core code)
- **Customizable**: Easy to extend and modify
- **Solid Defaults**: Works great out of the box

## 🔄 Evolution: From Config to Plugin

### NvChad v1 (Legacy)
- Complete standalone configuration
- Users cloned the entire NvChad repository
- Updates could conflict with customizations

### NvChad v2+ (Current)
- **Plugin-based architecture**
- **Starter template approach**
- **Cleaner separation of concerns**

## 📁 Current Architecture

```
Your Config (NvChad/starter)
├── init.lua              # Entry point
├── lua/
│   ├── chadrc.lua       # Main configuration
│   ├── mappings.lua     # Custom keybindings
│   ├── options.lua      # Neovim options
│   ├── autocmds.lua     # Auto commands
│   ├── plugins/         # Plugin specifications
│   └── configs/         # Plugin configurations
└── lazy-lock.json       # Plugin version lock

NvChad Core (as plugin)
├── lua/nvchad/
│   ├── init.lua         # Core initialization
│   ├── mappings.lua     # Default keybindings
│   ├── options.lua      # Default options
│   ├── autocmds.lua     # Core autocmds
│   ├── plugins/         # Default plugins
│   └── stl/             # Statusline components
```

## ⚡ Lazy Loading System

### Why Lazy Loading?
- **95% of plugins are lazy loaded**
- **Startup time**: 0.02-0.07 seconds
- **Resource efficiency**: Only load what's needed
- **Scalability**: Add plugins without performance impact

### How It Works
```lua
-- Default: lazy = true
{
  "plugin-name",
  lazy = true,  -- Only load when needed
  event = "BufRead",  -- Load on buffer read
  cmd = "PluginCommand",  -- Load on command
  ft = "lua",  -- Load for specific filetype
}

-- Force startup loading
{
  "essential-plugin",
  lazy = false,  -- Load immediately
}
```

### Performance Optimizations
- **Disabled built-in plugins**: Removes unused Vim plugins
- **Bytecode compilation**: Faster Lua execution
- **Modular loading**: Load components on demand

## 🎨 UI Architecture

### Base46 Theme System
```lua
-- Theme structure
M.base46 = {
  theme = "onedark",
  transparency = false,
  hl_override = {
    -- Custom highlight overrides
  }
}
```

### UI Components
- **Statusline**: Custom status bar
- **Tabufline**: Buffer management
- **NvDash**: Startup dashboard
- **Cheatsheet**: Auto-generated help

## 📦 Plugin System

### Plugin Categories
1. **Core Plugins**: Essential functionality
2. **UI Plugins**: Interface components
3. **Language Plugins**: LSP, syntax, etc.
4. **Utility Plugins**: Tools and enhancements

### Plugin Loading Strategy
```lua
-- Core plugins (always loaded)
base46    -- Theme system
ui        -- UI components
nvconfig  -- Configuration

-- Feature plugins (lazy loaded)
telescope -- File finder
nvim-tree -- File explorer
lspconfig -- Language servers
```

## 🔧 Configuration System

### Configuration Hierarchy
1. **NvChad defaults** (from plugin)
2. **User overrides** (in chadrc.lua)
3. **Local customizations** (in specific files)

### Configuration Flow
```
init.lua
├── Load NvChad core
├── Apply user config (chadrc.lua)
├── Load plugins (lazy.nvim)
├── Apply custom mappings
└── Execute autocmds
```

## 🚀 Startup Process

### Initialization Sequence
1. **Load core options** (nvchad.options)
2. **Initialize lazy.nvim** (plugin manager)
3. **Load theme system** (base46)
4. **Apply user configuration** (chadrc.lua)
5. **Setup lazy loading** (plugin events)
6. **Load essential plugins** (lazy=false)
7. **Apply keybindings** (mappings)
8. **Execute autocmds** (automation)

### Performance Metrics
- **Cold start**: ~0.05 seconds
- **Warm start**: ~0.02 seconds
- **Plugin loading**: On-demand only
- **Memory usage**: Minimal baseline

## 🔍 Module System

### Core Modules
```lua
require "nvchad.options"   -- Default options
require "nvchad.mappings"  -- Default keybindings
require "nvchad.autocmds"  -- Default autocmds
```

### Extension Points
- **chadrc.lua**: Main configuration override
- **mappings.lua**: Custom keybindings
- **plugins/**: Plugin specifications
- **configs/**: Plugin configurations

## 🛠️ Customization Architecture

### Override System
```lua
-- In chadrc.lua
local M = {}

M.base46 = {
  theme = "custom-theme",
  hl_override = {
    Comment = { italic = true },
  }
}

M.ui = {
  statusline = {
    theme = "vscode",
  }
}

return M
```

### Plugin Customization
```lua
-- In plugins/init.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "vim", "html" }
    }
  }
}
```

## 🔄 Update System

### Plugin Updates
- **lazy-lock.json**: Version pinning
- **:Lazy sync**: Update all plugins
- **:Lazy update**: Check for updates

### Configuration Updates
- **NvChad updates**: Through plugin system
- **User config**: Remains untouched
- **Migration**: Minimal breaking changes

## 🎯 Design Benefits

### For Users
- **Fast startup**: No waiting time
- **Consistent experience**: Standardized UI
- **Easy customization**: Clear override system
- **Stable updates**: Plugin architecture

### For Developers
- **Modular design**: Easy to maintain
- **Clear separation**: Core vs user code
- **Extensible**: Plugin-based additions
- **Performance**: Lazy loading by default

---

*This architecture enables NvChad to be both powerful and performant, providing a solid foundation for any Neovim workflow.*