# Theme Configuration

Complete guide to configuring themes in NvChad.

## 🎯 Basic Configuration

### Default Theme Setup
```lua
-- In lua/chadrc.lua
local M = {}

M.base46 = {
  theme = "onedark",           -- Default theme
  transparency = false,        -- Terminal transparency
}

return M
```

### Theme Toggle Configuration
```lua
M.base46 = {
  theme = "onedark",
  theme_toggle = {
    "onedark",                 -- Dark theme
    "one_light",               -- Light theme
  },
}
```

## 🔧 Advanced Configuration

### Complete Configuration Example
```lua
-- In lua/chadrc.lua
local M = {}

M.base46 = {
  theme = "onedark",
  transparency = false,
  
  theme_toggle = {
    "onedark",
    "one_light",
  },
  
  hl_override = {
    Comment = { 
      italic = true,
      fg = "#7C7C7C" 
    },
    String = { 
      fg = "#98C379" 
    },
    Function = { 
      fg = "#61AFEF",
      bold = true 
    },
    CursorLine = { 
      bg = "#2E2E2E" 
    },
    LineNr = { 
      fg = "#4B4B4B" 
    },
    
    -- TreeSitter highlights
    ["@variable"] = { fg = "#E5C07B" },
    ["@function"] = { fg = "#61AFEF", bold = true },
    ["@keyword"] = { fg = "#C678DD", bold = true },
    ["@string"] = { fg = "#98C379" },
    ["@comment"] = { fg = "#7C7C7C", italic = true },
  },
  
  hl_add = {
    MyCustomHighlight = { 
      fg = "#FF6B6B",
      bg = "#1E1E1E",
      bold = true 
    },
  },
}

return M
```

## 🎨 UI Component Configuration

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
    
    -- Custom modules
    modules = {
      custom_module = function()
        return "Custom"
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
    order = { "treeOffset", "buffers", "tabs", "btns" },
    
    -- Custom modules
    modules = {
      custom_tab = function()
        return "Custom Tab"
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

## 🔍 Plugin Integration

### Telescope Theme Integration
```lua
M.plugins = {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        -- Use NvChad theme colors
        winblend = 0,
        border = true,
        borderchars = {
          "─", "│", "─", "│", "╭", "╮", "╯", "╰"
        },
      },
    },
  },
}
```

### CMP Theme Integration
```lua
M.plugins = {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = {
          winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
          scrollbar = false,
        },
        documentation = {
          winhighlight = "Normal:CmpDoc",
        },
      },
    },
  },
}
```

## 🎯 Conditional Configuration

### Environment-Based Configuration
```lua
-- Different themes for different environments
local function get_theme_for_env()
  local env = vim.fn.getenv("NVCHAD_THEME")
  if env then
    return env
  end
  
  -- Default based on system
  if vim.fn.has("mac") == 1 then
    return "onedark"
  elseif vim.fn.has("unix") == 1 then
    return "gruvbox"
  else
    return "material"
  end
end

M.base46 = {
  theme = get_theme_for_env(),
}
```

### Time-Based Configuration
```lua
local function get_time_based_theme()
  local hour = tonumber(os.date("%H"))
  
  if hour >= 6 and hour < 18 then
    return {
      theme = "one_light",
      transparency = false,
    }
  else
    return {
      theme = "onedark",
      transparency = true,
    }
  end
end

local time_config = get_time_based_theme()
M.base46 = time_config
```

### Project-Based Configuration
```lua
local function get_project_theme()
  local cwd = vim.fn.getcwd()
  local project_name = vim.fn.fnamemodify(cwd, ":t")
  
  local project_themes = {
    ["web-project"] = "tokyonight",
    ["backend-api"] = "gruvbox",
    ["mobile-app"] = "material",
    ["docs-site"] = "one_light",
  }
  
  return project_themes[project_name] or "onedark"
end

M.base46 = {
  theme = get_project_theme(),
}
```

## 🔧 Performance Configuration

### Lazy Loading Configuration
```lua
M.ui = {
  statusline = {
    lazyload = true,         -- Load statusline lazily
  },
  
  tabufline = {
    lazyload = true,         -- Load tabufline lazily
  },
}

M.nvdash = {
  load_on_startup = false,   -- Don't load dashboard on startup
}
```

### Caching Configuration
```lua
-- Enable theme caching for faster startup
M.base46 = {
  theme = "onedark",
  cache = true,              -- Enable theme caching
  
  -- Compile themes on startup
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/nvchad/base46/",
  },
}
```

## 🎨 Custom Theme Configuration

### Local Theme Configuration
```lua
-- Use local theme file
M.base46 = {
  theme = "my_custom_theme",  -- Points to lua/themes/my_custom_theme.lua
  
  -- Override parts of custom theme
  hl_override = {
    -- Additional customizations
    Normal = { bg = "#1A1A1A" },
  },
}
```

### Multiple Theme Files
```lua
-- Different theme files for different purposes
local function get_theme_file()
  local time = os.date("*t")
  
  if time.hour >= 9 and time.hour < 17 then
    return "work_theme"      -- Professional theme for work hours
  elseif time.hour >= 17 and time.hour < 22 then
    return "evening_theme"   -- Comfortable theme for evening
  else
    return "night_theme"     -- Dark theme for night
  end
end

M.base46 = {
  theme = get_theme_file(),
}
```

## 🔍 Configuration Validation

### Theme Validation
```lua
local function validate_theme(theme_name)
  local theme_path = vim.fn.stdpath("data") .. "/lazy/base46/lua/base46/themes/" .. theme_name .. ".lua"
  return vim.fn.filereadable(theme_path) == 1
end

local function safe_theme_config(theme_name)
  if validate_theme(theme_name) then
    return theme_name
  else
    vim.notify("Theme '" .. theme_name .. "' not found, using default", vim.log.levels.WARN)
    return "onedark"
  end
end

M.base46 = {
  theme = safe_theme_config("my_theme"),
}
```

### Configuration Testing
```lua
-- Test configuration before applying
local function test_config(config)
  local ok, err = pcall(function()
    require("base46").load_theme(config.theme)
  end)
  
  if not ok then
    vim.notify("Theme configuration error: " .. err, vim.log.levels.ERROR)
    return false
  end
  
  return true
end

local config = {
  theme = "onedark",
  transparency = false,
}

if test_config(config) then
  M.base46 = config
end
```

## 🎯 Best Practices

### Configuration Organization
```lua
-- Good: Organized configuration
local M = {}

-- Theme configuration
M.base46 = {
  theme = "onedark",
  transparency = false,
  theme_toggle = { "onedark", "one_light" },
  
  -- Keep overrides organized
  hl_override = require("configs.highlights").get_overrides(),
}

-- UI configuration
M.ui = {
  statusline = require("configs.statusline"),
  tabufline = require("configs.tabufline"),
}

-- Dashboard configuration
M.nvdash = require("configs.nvdash")

return M
```

### Modular Configuration
```lua
-- configs/highlights.lua
local M = {}

M.get_overrides = function()
  return {
    Comment = { italic = true, fg = "#7C7C7C" },
    String = { fg = "#98C379" },
    Function = { fg = "#61AFEF", bold = true },
  }
end

return M
```

### Environment Variables
```bash
# Set theme via environment variable
export NVCHAD_THEME="tokyonight"
export NVCHAD_TRANSPARENCY="true"
```

```lua
-- Use environment variables
M.base46 = {
  theme = vim.fn.getenv("NVCHAD_THEME") or "onedark",
  transparency = vim.fn.getenv("NVCHAD_TRANSPARENCY") == "true",
}
```

---

*Proper theme configuration ensures consistent, performant, and personalized appearance across all NvChad components.*