# NvChad Theming System

Complete guide to NvChad's theming system, colorschemes, and customization.

## 🎨 Base46 Theme Engine

### Architecture Overview
NvChad uses **Base46** as its custom theme engine, providing:
- **68+ built-in themes** with consistent styling
- **Live theme switching** without restart
- **Highlight customization** and overrides
- **Transparency support** for modern terminals
- **Automatic theme compilation** for performance

### Theme Structure
```lua
-- Basic theme configuration
M.base46 = {
  theme = "onedark",           -- Active theme
  transparency = false,        -- Terminal transparency
  theme_toggle = {            -- Toggle between themes
    "onedark",
    "one_light",
  },
  hl_override = {             -- Highlight overrides
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  hl_add = {                  -- New highlight groups
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
}
```

## 🎯 Available Themes

### Popular Themes
- **onedark** - Dark theme with blue accents
- **one_light** - Light variant of onedark
- **gruvbox** - Retro groove colors
- **tokyonight** - Tokyo night-inspired
- **catppuccin** - Warm, pastel colors
- **nord** - Arctic, north-bluish color palette
- **dracula** - Dark theme with bright colors
- **material** - Google Material Design colors

### Theme Categories
- **Dark themes**: onedark, tokyonight, dracula, nord
- **Light themes**: one_light, gruvbox_light, material_light
- **Retro themes**: gruvbox, retro, vintage
- **Modern themes**: catppuccin, material, tokyonight
- **Minimal themes**: minimal, clean, simple

## 🔧 Theme Management

### Theme Switching
```vim
" Switch themes on the fly
:lua require("base46").load_theme("tokyonight")
```

### Theme Picker
- **Keybinding**: `<leader>th`
- **Command**: `:Telescope themes`
- **Features**: Live preview, instant switching

### Theme Toggle
```lua
-- In chadrc.lua
M.base46 = {
  theme_toggle = { "onedark", "one_light" },
}
```
- **Keybinding**: `<leader>tt`
- **Function**: Toggle between defined themes

## 🎨 Theme Customization

### Highlight Overrides
```lua
-- In chadrc.lua
M.base46 = {
  theme = "onedark",
  hl_override = {
    -- Override existing highlights
    Comment = { 
      italic = true,
      fg = "#7C7C7C",
    },
    ["@comment"] = { 
      italic = true,
      fg = "#7C7C7C",
    },
    CursorLine = { 
      bg = "#2E2E2E",
    },
    LineNr = { 
      fg = "#4B4B4B",
    },
    -- String highlights
    String = { 
      fg = "#98C379",
      italic = true,
    },
    -- Function highlights
    Function = { 
      fg = "#61AFEF",
      bold = true,
    },
  },
}
```

### Adding New Highlights
```lua
M.base46 = {
  hl_add = {
    -- Add completely new highlight groups
    MyCustomHighlight = { 
      fg = "#FF6B6B",
      bg = "#1E1E1E",
      bold = true,
    },
    ErrorMsg = { 
      fg = "#E06C75",
      bg = "#3E2723",
    },
    WarningMsg = { 
      fg = "#E5C07B",
      bg = "#2E2E2E",
    },
  },
}
```

## 🎯 Creating Custom Themes

### Theme File Structure
```lua
-- In lua/themes/mytheme.lua
local M = {}

M.base_30 = {
  white = "#FFFFFF",
  darker_black = "#1B1B1B",
  black = "#1E1E1E",
  black2 = "#252525",
  one_bg = "#282828",
  one_bg2 = "#353535",
  one_bg3 = "#3E3E3E",
  grey = "#4B4B4B",
  grey_fg = "#545454",
  grey_fg2 = "#616161",
  light_grey = "#6F6F6F",
  red = "#E06C75",
  baby_pink = "#FF6B9D",
  pink = "#FF75A0",
  line = "#313131",
  green = "#98C379",
  vibrant_green = "#A6E22E",
  blue = "#61AFEF",
  nord_blue = "#81A1C1",
  yellow = "#E5C07B",
  sun = "#FFCB6B",
  purple = "#C678DD",
  dark_purple = "#A076C4",
  teal = "#56B6C2",
  orange = "#D19A66",
  cyan = "#56B6C2",
  statusline_bg = "#202020",
  lightbg = "#2E2E2E",
  pmenu_bg = "#98C379",
  folder_bg = "#61AFEF",
}

M.base_16 = {
  base00 = "#1E1E1E",
  base01 = "#252525",
  base02 = "#353535",
  base03 = "#3E3E3E",
  base04 = "#565656",
  base05 = "#B4B4B4",
  base06 = "#C8C8C8",
  base07 = "#FFFFFF",
  base08 = "#E06C75",
  base09 = "#D19A66",
  base0A = "#E5C07B",
  base0B = "#98C379",
  base0C = "#56B6C2",
  base0D = "#61AFEF",
  base0E = "#C678DD",
  base0F = "#BE5046",
}

M.polish_hl = {
  -- Additional highlight customizations
  ["@variable"] = { fg = M.base_30.white },
  ["@property"] = { fg = M.base_30.red },
}

M.type = "dark"  -- or "light"

return M
```

### Using Custom Theme
```lua
-- In chadrc.lua
M.base46 = {
  theme = "mytheme",  -- Your custom theme name
}
```

## 🔍 Theme Components

### UI Elements
- **Statusline**: Bottom status bar
- **Tabufline**: Buffer tabs
- **NvimTree**: File explorer
- **Telescope**: Fuzzy finder
- **LSP**: Language server highlights
- **Syntax**: Code highlighting

### Highlight Groups
- **Normal**: Default text
- **Comment**: Comments
- **String**: String literals
- **Function**: Function names
- **Keyword**: Language keywords
- **Type**: Type annotations
- **Constant**: Constants
- **Variable**: Variables

## 🎨 Theme Integration

### Plugin Themes
```lua
-- Telescope theme integration
require("telescope").setup {
  defaults = {
    -- Will automatically use NvChad theme
  }
}
```

### External Plugin Themes
```lua
-- For plugins that need manual theme setup
require("plugin-name").setup {
  theme = {
    -- Use colors from current theme
    bg = require("base46").get_theme_tb("base_30").black,
    fg = require("base46").get_theme_tb("base_30").white,
  }
}
```

## 🔧 Advanced Theming

### Dynamic Theme Loading
```lua
-- Function to load theme dynamically
local function load_theme(theme_name)
  require("base46").load_theme(theme_name)
end

-- Map to keybinding
vim.keymap.set("n", "<leader>t1", function()
  load_theme("onedark")
end, { desc = "Load onedark theme" })
```

### Conditional Theming
```lua
-- Auto theme based on time
local function auto_theme()
  local hour = tonumber(os.date("%H"))
  if hour >= 6 and hour < 18 then
    require("base46").load_theme("one_light")
  else
    require("base46").load_theme("onedark")
  end
end

-- Apply on startup
auto_theme()
```

### Theme Persistence
```lua
-- Save theme preference
local function save_theme(theme_name)
  local file = io.open(vim.fn.stdpath("config") .. "/current_theme", "w")
  if file then
    file:write(theme_name)
    file:close()
  end
end

-- Load saved theme
local function load_saved_theme()
  local file = io.open(vim.fn.stdpath("config") .. "/current_theme", "r")
  if file then
    local theme = file:read("*all")
    file:close()
    if theme and theme ~= "" then
      require("base46").load_theme(theme:gsub("%s+", ""))
    end
  end
end
```

## 🎯 Theme Debugging

### Theme Information
```lua
-- Get current theme info
local theme = require("base46").get_theme_tb("base_30")
print(vim.inspect(theme))
```

### Highlight Inspection
```vim
" Check highlight group under cursor
:echo synIDattr(synID(line("."), col("."), 1), "name")

" Show all highlight groups
:so $VIMRUNTIME/syntax/hitest.vim
```

### Theme Reload
```lua
-- Force reload current theme
require("base46").load_theme()
```

## 🔧 Transparency Support

### Enable Transparency
```lua
-- In chadrc.lua
M.base46 = {
  theme = "onedark",
  transparency = true,
}
```

### Transparency Levels
- **Full transparency**: Background completely transparent
- **Partial transparency**: Some UI elements transparent
- **None**: Solid background colors

### Terminal Setup
```bash
# Terminal transparency settings
# Set terminal background to transparent
# Enable blur effects (iTerm2, Alacritty)
```

---

*The Base46 theme system provides unparalleled flexibility while maintaining consistency across all UI elements.*