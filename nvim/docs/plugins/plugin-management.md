# Plugin Management in NvChad

Complete guide to adding, removing, configuring, and managing plugins in NvChad.

## 📦 Adding New Plugins

### Basic Plugin Addition
```lua
-- In lua/plugins/init.lua
return {
  {
    "author/plugin-name",
    lazy = true,  -- Recommended for performance
    event = "BufRead",  -- Load trigger
    config = function()
      -- Plugin setup
    end,
  }
}
```

### Plugin with Configuration
```lua
{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        layout_strategy = "horizontal",
      }
    })
  end,
}
```

### Plugin with Options
```lua
{
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua", "vim", "html", "css", "javascript" },
    highlight = { enable = true },
    indent = { enable = true },
  }
}
```

## 🚫 Disabling Default Plugins

### Completely Disable Plugin
```lua
{
  "folke/which-key.nvim",
  enabled = false,
}
```

### Conditional Disabling
```lua
{
  "nvim-tree/nvim-tree.lua",
  enabled = vim.fn.executable("tree") == 1,
}
```

## 🔧 Configuring Existing Plugins

### Override Default Configuration
```lua
{
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Extend default options
    opts.ensure_installed = vim.list_extend(opts.ensure_installed, {
      "typescript", "tsx", "json"
    })
    return opts
  end,
}
```

### Replace Configuration
```lua
{
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      -- Your complete configuration
      view = { width = 40 },
      renderer = { group_empty = true },
    })
  end,
}
```

## 🎯 Plugin Loading Strategies

### Event-Based Loading
```lua
{
  "plugin-name",
  event = "BufRead",        -- On buffer read
  event = "InsertEnter",    -- On insert mode
  event = "VeryLazy",       -- After UI loaded
  event = { "BufRead", "BufNewFile" },  -- Multiple events
}
```

### Command-Based Loading
```lua
{
  "plugin-name",
  cmd = "PluginCommand",    -- Single command
  cmd = { "Cmd1", "Cmd2" }, -- Multiple commands
}
```

### Filetype-Based Loading
```lua
{
  "plugin-name",
  ft = "lua",               -- Single filetype
  ft = { "lua", "vim" },    -- Multiple filetypes
}
```

### Key-Based Loading
```lua
{
  "plugin-name",
  keys = "<leader>p",       -- Single key
  keys = {                  -- Multiple keys
    { "<leader>p", "<cmd>PluginCommand<cr>", desc = "Plugin action" },
    { "<leader>P", mode = "v" },
  }
}
```

## 📂 Plugin Organization

### Separate Plugin Files
```lua
-- lua/plugins/init.lua
return {
  { import = "plugins.editor" },
  { import = "plugins.lsp" },
  { import = "plugins.ui" },
}

-- lua/plugins/editor.lua
return {
  { "plugin1" },
  { "plugin2" },
}
```

### Grouped by Functionality
```lua
-- lua/plugins/init.lua
return {
  -- Editor plugins
  { "editor-plugin1" },
  { "editor-plugin2" },
  
  -- LSP plugins
  { "lsp-plugin1" },
  { "lsp-plugin2" },
  
  -- UI plugins
  { "ui-plugin1" },
  { "ui-plugin2" },
}
```

## 🔄 Plugin Updates

### Update Commands
```vim
:Lazy update              " Update all plugins
:Lazy update telescope    " Update specific plugin
:Lazy sync               " Install + update
:Lazy restore            " Restore to lockfile versions
```

### Version Pinning
```lua
{
  "plugin-name",
  version = "1.0.0",      -- Specific version
  version = "^1.0",       -- Compatible version
  commit = "abc123",      -- Specific commit
  branch = "develop",     -- Specific branch
}
```

## 🗑️ Removing Plugins

### Remove from Configuration
1. Delete plugin specification from `lua/plugins/init.lua`
2. Run `:Lazy clean` to remove plugin files
3. Restart Neovim

### Clean Unused Plugins
```vim
:Lazy clean             " Remove unused plugins
:Lazy clear            " Clear cache
```

## 🧪 Plugin Development

### Local Plugin Development
```lua
{
  "~/projects/my-plugin",
  dev = true,             -- Use local development
  config = function()
    -- Development configuration
  end,
}
```

### Plugin Debugging
```lua
{
  "plugin-name",
  config = function()
    -- Add debug prints
    print("Plugin loaded")
    require("plugin-name").setup({
      debug = true,
    })
  end,
}
```

## 📊 Plugin Performance

### Profiling Plugins
```vim
:Lazy profile           " Startup profiling
:Lazy log              " View logs
```

### Performance Best Practices
```lua
{
  "heavy-plugin",
  lazy = true,           -- Always use lazy loading
  event = "VeryLazy",    -- Load after UI
  cond = function()      -- Conditional loading
    return vim.fn.executable("required-tool") == 1
  end,
}
```

## 🔍 Troubleshooting

### Common Issues

#### Plugin Not Loading
```lua
-- Check lazy loading configuration
{
  "plugin-name",
  lazy = false,  -- Force immediate loading for testing
}
```

#### Configuration Errors
```vim
:checkhealth lazy      " Check plugin health
:Lazy log             " View error logs
```

#### Dependency Issues
```lua
{
  "plugin-name",
  dependencies = {
    "required-plugin",
    "another-dependency",
  }
}
```

### Debug Commands
```vim
:Lazy debug           " Debug information
:Lazy profile         " Startup profiling
:Lazy log            " View logs
:checkhealth         " System health
```

## 📋 Plugin Configuration Examples

### LSP Plugin Setup
```lua
{
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("configs.lspconfig")
  end,
}
```

### Formatting Plugin
```lua
{
  "stevearc/conform.nvim",
  event = "BufWritePre",
  config = function()
    require("configs.conform")
  end,
}
```

### Git Plugin
```lua
{
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
      }
    })
  end,
}
```

## 🎯 Advanced Configuration

### Plugin Hooks
```lua
{
  "plugin-name",
  init = function()
    -- Run before plugin loads
  end,
  config = function()
    -- Run after plugin loads
  end,
  build = function()
    -- Run after installation/update
  end,
}
```

### Multiple Configurations
```lua
{
  "plugin-name",
  config = function()
    local config = require("plugin-name.config")
    
    if vim.g.some_condition then
      config.setup(require("configs.plugin-alt"))
    else
      config.setup(require("configs.plugin-default"))
    end
  end,
}
```

---

*Effective plugin management is key to maintaining a fast, stable, and powerful Neovim setup.*