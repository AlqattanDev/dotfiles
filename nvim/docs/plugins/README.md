# NvChad Plugin System

Understanding how NvChad manages plugins with lazy.nvim and the plugin ecosystem.

## 📦 Plugin Architecture

### Plugin Manager: lazy.nvim
NvChad uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management, providing:
- **Lazy loading**: 95% of plugins loaded on-demand
- **Fast startup**: Plugins load only when needed
- **Dependency management**: Automatic handling
- **UI interface**: `:Lazy` command for management

### Plugin Structure
```lua
-- Basic plugin specification
{
  "author/plugin-name",
  lazy = true,              -- Lazy load (default)
  event = "BufRead",        -- Load trigger
  dependencies = {...},     -- Required plugins
  config = function() ... end, -- Setup function
  opts = {...},             -- Plugin options
}
```

## 🎯 Plugin Categories

### 1. Core Plugins (Essential)
- **nvchad/base46**: Theme system
- **nvchad/ui**: UI components
- **lazy.nvim**: Plugin manager itself

### 2. Language Support
- **neovim/nvim-lspconfig**: LSP configuration
- **nvim-treesitter/nvim-treesitter**: Syntax highlighting
- **williamboman/mason.nvim**: LSP/DAP manager

### 3. File Management
- **nvim-tree/nvim-tree.lua**: File explorer
- **nvim-telescope/telescope.nvim**: Fuzzy finder

### 4. Git Integration
- **lewis6991/gitsigns.nvim**: Git decorations

### 5. Editing Enhancement
- **hrsh7th/nvim-cmp**: Autocompletion
- **windwp/nvim-autopairs**: Auto-close brackets
- **L3MON4D3/LuaSnip**: Snippet engine

### 6. UI Enhancement
- **folke/which-key.nvim**: Keybinding help
- **nvim-lua/plenary.nvim**: Utility functions

## 🔧 Plugin Loading Strategies

### Lazy Loading (Default)
```lua
{
  "plugin-name",
  lazy = true,  -- Default behavior
  event = "BufRead",  -- Load on buffer read
  cmd = "PluginCommand",  -- Load on command
  ft = "lua",  -- Load for filetype
  keys = "<leader>f",  -- Load on keypress
}
```

### Immediate Loading
```lua
{
  "essential-plugin",
  lazy = false,  -- Load at startup
  priority = 1000,  -- Load order
}
```

## 🚀 Plugin Management Commands

### Lazy Interface
- **:Lazy**: Open plugin manager UI
- **:Lazy install**: Install missing plugins
- **:Lazy update**: Update all plugins
- **:Lazy sync**: Install + update
- **:Lazy clean**: Remove unused plugins
- **:Lazy check**: Check plugin status

### Plugin Information
- **:Lazy profile**: Startup profiling
- **:Lazy log**: View plugin logs
- **:Lazy debug**: Debug information

## 📂 Plugin Configuration Files

### Location Structure
```
lua/
├── plugins/
│   ├── init.lua          # Main plugin specs
│   ├── lsp.lua           # LSP plugins
│   ├── ui.lua            # UI plugins
│   └── tools.lua         # Utility plugins
└── configs/
    ├── lspconfig.lua     # LSP configuration
    ├── telescope.lua     # Telescope config
    └── treesitter.lua    # Treesitter config
```

### Configuration Pattern
```lua
-- In configs/plugin-name.lua
local options = {
  -- plugin configuration
}

require("plugin-name").setup(options)
```

## 🔄 Plugin Lifecycle

### Installation Process
1. **Specification**: Define in `plugins/init.lua`
2. **Download**: lazy.nvim clones repository
3. **Configuration**: Apply settings
4. **Loading**: Based on lazy loading rules
5. **Activation**: Plugin becomes available

### Update Process
1. **Check**: Compare with remote
2. **Download**: Pull latest changes
3. **Reload**: Restart if needed
4. **Lock**: Update `lazy-lock.json`

## 🛠️ Customization Examples

### Adding New Plugin
```lua
-- In plugins/init.lua
return {
  {
    "new-plugin/awesome-plugin",
    event = "BufRead",
    config = function()
      require("awesome-plugin").setup({
        option1 = "value1",
        option2 = true,
      })
    end,
  }
}
```

### Disabling Default Plugin
```lua
{
  "default-plugin",
  enabled = false,
}
```

### Overriding Plugin Config
```lua
{
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua", "vim", "html", "css" },
    highlight = { enable = true },
  }
}
```

## 🎯 Performance Considerations

### Lazy Loading Benefits
- **Faster startup**: Only essential plugins loaded
- **Memory efficiency**: Reduced RAM usage
- **Scalability**: Add plugins without startup cost

### Best Practices
- **Use lazy loading**: Unless absolutely necessary
- **Specific triggers**: Use appropriate events/commands
- **Group related plugins**: Organize by functionality
- **Profile startup**: Use `:Lazy profile` to identify bottlenecks

## 🔍 Troubleshooting

### Common Issues
- **Plugin not loading**: Check lazy loading configuration
- **Conflicts**: Review plugin dependencies
- **Performance**: Use profiling tools
- **Configuration**: Verify setup functions

### Debug Commands
```vim
:Lazy profile    " Startup profiling
:Lazy log       " View logs
:checkhealth    " System health
```

## 📋 Plugin Status

### Version Locking
- **lazy-lock.json**: Pins plugin versions
- **Reproducible**: Same versions across systems
- **Stability**: Prevents breaking changes

### Health Checks
```vim
:checkhealth lazy     " Plugin manager health
:checkhealth nvim     " Neovim health
:checkhealth mason    " LSP health
```

---

*The plugin system is designed for maximum flexibility while maintaining performance through intelligent lazy loading.*