# NvChad Configuration System

Understanding NvChad's configuration architecture and customization options.

## 🏗️ Configuration Architecture

### Configuration Files
- **`lua/chadrc.lua`**: Main configuration file
- **`lua/options.lua`**: Neovim options
- **`lua/mappings.lua`**: Custom keybindings
- **`lua/autocmds.lua`**: Auto commands
- **`lua/plugins/`**: Plugin specifications
- **`lua/configs/`**: Plugin configurations

### Configuration Hierarchy
```
1. NvChad defaults (from plugin)
2. User configuration (chadrc.lua)
3. Local overrides (specific files)
```

## 📋 Configuration Structure

### Main Configuration (chadrc.lua)
```lua
-- This file needs to have same structure as nvconfig.lua
local M = {}

M.base46 = {
  theme = "onedark",
  transparency = false,
  theme_toggle = { "onedark", "one_light" },
  
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "default",
  },
  
  tabufline = {
    enabled = true,
    lazyload = true,
  },
}

M.nvdash = {
  load_on_startup = true,
}

return M
```

### Options Configuration
```lua
-- lua/options.lua
local opt = vim.opt

-- UI options
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.colorcolumn = "80"

-- Editing options
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search options
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- File options
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
```

## 🎨 Theme Configuration

### Base46 Configuration
```lua
M.base46 = {
  theme = "onedark",           -- Active theme
  transparency = false,        -- Terminal transparency
  
  -- Theme toggle
  theme_toggle = {
    "onedark",                 -- Dark theme
    "one_light",               -- Light theme
  },
  
  -- Highlight overrides
  hl_override = {
    Comment = { italic = true },
    String = { fg = "#98C379" },
    Function = { fg = "#61AFEF", bold = true },
    
    -- TreeSitter highlights
    ["@variable"] = { fg = "#E5C07B" },
    ["@function"] = { fg = "#61AFEF", bold = true },
    ["@keyword"] = { fg = "#C678DD", bold = true },
  },
  
  -- Additional highlights
  hl_add = {
    MyCustomHighlight = { 
      fg = "#FF6B6B",
      bg = "#1E1E1E",
      bold = true 
    },
  },
}
```

## 🖥️ UI Configuration

### Statusline Configuration
```lua
M.ui = {
  statusline = {
    theme = "default",         -- default, vscode, vscode_colored, minimal
    separator_style = "default", -- default, round, block, arrow
    
    -- Module order
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "diagnostics",
      "lsp",
      "cursor",
      "cwd",
    },
    
    -- Module overrides
    modules = {
      file = function()
        return " Custom File Info "
      end,
    },
  },
}
```

### Tabufline Configuration
```lua
M.ui = {
  tabufline = {
    enabled = true,
    lazyload = true,
    
    -- Module order
    order = { "treeOffset", "buffers", "tabs", "btns" },
    
    -- Module overrides
    modules = {
      btns = function()
        return " Custom Buttons "
      end,
    },
  },
}
```

### NvDash Configuration
```lua
M.nvdash = {
  load_on_startup = true,
  
  header = {
    "   Custom Header   ",
    "  Welcome to NvChad  ",
  },
  
  buttons = {
    { "  Find File", "Spc f f", "Telescope find_files" },
    { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
    { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
    { "  Bookmarks", "Spc m a", "Telescope marks" },
    { "  Themes", "Spc t h", "Telescope themes" },
    { "  Mappings", "Spc c h", "NvCheatsheet" },
  },
}
```

## 🔧 Plugin Configuration

### Plugin Structure
```lua
-- lua/plugins/init.lua
return {
  {
    "plugin-name",
    config = function()
      require("configs.plugin-name")
    end,
  },
}
```

### Plugin Config Files
```lua
-- lua/configs/plugin-name.lua
local options = {
  -- plugin configuration
}

require("plugin-name").setup(options)
```

## 🎯 Complete Configuration Examples

### Minimal Configuration
```lua
-- lua/chadrc.lua
local M = {}

M.base46 = {
  theme = "onedark",
}

return M
```

### Advanced Configuration
```lua
-- lua/chadrc.lua
local M = {}

-- Theme configuration
M.base46 = {
  theme = "onedark",
  transparency = false,
  theme_toggle = { "onedark", "one_light" },
  
  hl_override = {
    Comment = { italic = true, fg = "#7C7C7C" },
    String = { fg = "#98C379" },
    Function = { fg = "#61AFEF", bold = true },
    CursorLine = { bg = "#2E2E2E" },
    LineNr = { fg = "#4B4B4B" },
    
    -- TreeSitter
    ["@variable"] = { fg = "#E5C07B" },
    ["@function"] = { fg = "#61AFEF", bold = true },
    ["@keyword"] = { fg = "#C678DD", bold = true },
    ["@string"] = { fg = "#98C379" },
    ["@comment"] = { fg = "#7C7C7C", italic = true },
    
    -- LSP
    DiagnosticError = { fg = "#E06C75" },
    DiagnosticWarn = { fg = "#E5C07B" },
    DiagnosticInfo = { fg = "#61AFEF" },
    DiagnosticHint = { fg = "#56B6C2" },
  },
}

-- UI configuration
M.ui = {
  statusline = {
    theme = "vscode_colored",
    separator_style = "round",
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "diagnostics",
      "lsp",
      "cursor",
      "cwd",
    },
  },
  
  tabufline = {
    enabled = true,
    lazyload = true,
  },
}

-- Dashboard configuration
M.nvdash = {
  load_on_startup = true,
  header = {
    "███╗   ██╗██╗   ██╗ ██████╗██╗  ██╗ █████╗ ██████╗ ",
    "████╗  ██║██║   ██║██╔════╝██║  ██║██╔══██╗██╔══██╗",
    "██╔██╗ ██║██║   ██║██║     ███████║███████║██║  ██║",
    "██║╚██╗██║╚██╗ ██╔╝██║     ██╔══██║██╔══██║██║  ██║",
    "██║ ╚████║ ╚████╔╝ ╚██████╗██║  ██║██║  ██║██████╔╝",
    "╚═╝  ╚═══╝  ╚═══╝   ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ",
  },
  
  buttons = {
    { "  Find File", "Spc f f", "Telescope find_files" },
    { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
    { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
    { "  Bookmarks", "Spc m a", "Telescope marks" },
    { "  Themes", "Spc t h", "Telescope themes" },
    { "  Mappings", "Spc c h", "NvCheatsheet" },
  },
}

return M
```

## 🔍 Configuration Validation

### Validation Function
```lua
local function validate_config(config)
  local errors = {}
  
  -- Validate theme
  if config.base46 and config.base46.theme then
    local theme_path = vim.fn.stdpath("data") .. "/lazy/base46/lua/base46/themes/" .. config.base46.theme .. ".lua"
    if vim.fn.filereadable(theme_path) == 0 then
      table.insert(errors, "Theme '" .. config.base46.theme .. "' not found")
    end
  end
  
  -- Validate statusline theme
  if config.ui and config.ui.statusline and config.ui.statusline.theme then
    local valid_themes = { "default", "vscode", "vscode_colored", "minimal" }
    if not vim.tbl_contains(valid_themes, config.ui.statusline.theme) then
      table.insert(errors, "Invalid statusline theme: " .. config.ui.statusline.theme)
    end
  end
  
  return errors
end

-- Usage
local config = require("chadrc")
local errors = validate_config(config)
if #errors > 0 then
  for _, error in ipairs(errors) do
    vim.notify(error, vim.log.levels.ERROR)
  end
end
```

## 🛠️ Configuration Management

### Configuration Backup
```lua
-- Function to backup configuration
local function backup_config()
  local config_path = vim.fn.stdpath("config") .. "/lua/chadrc.lua"
  local backup_path = config_path .. ".backup." .. os.date("%Y%m%d_%H%M%S")
  
  vim.fn.writefile(vim.fn.readfile(config_path), backup_path)
  vim.notify("Configuration backed up to: " .. backup_path)
end
```

### Configuration Reset
```lua
-- Function to reset to default configuration
local function reset_config()
  local config_path = vim.fn.stdpath("config") .. "/lua/chadrc.lua"
  local default_config = [[
local M = {}

M.base46 = {
  theme = "onedark",
}

return M
]]
  
  vim.fn.writefile(vim.split(default_config, "\n"), config_path)
  vim.notify("Configuration reset to defaults")
end
```

---

*The configuration system provides complete control over NvChad's appearance and behavior while maintaining simplicity and performance.*