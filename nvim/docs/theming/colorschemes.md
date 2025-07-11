# NvChad Colorschemes

Complete reference of all available colorschemes in NvChad.

## 🎨 All Available Themes

### Dark Themes

#### **onedark** (Default)
- **Type**: Dark
- **Accent**: Blue
- **Style**: Modern, clean
- **Best for**: General development, long coding sessions

#### **tokyonight**
- **Type**: Dark
- **Accent**: Purple/Blue
- **Style**: Vibrant, inspired by Tokyo's neon nights
- **Best for**: Modern development, UI work

#### **catppuccin**
- **Type**: Dark
- **Accent**: Warm pastels
- **Style**: Cozy, warm colors
- **Best for**: Comfortable coding, reducing eye strain

#### **gruvbox**
- **Type**: Dark
- **Accent**: Orange/Yellow
- **Style**: Retro, warm
- **Best for**: Vintage feel, earthy tones

#### **nord**
- **Type**: Dark
- **Accent**: Blue/Cyan
- **Style**: Arctic, minimal
- **Best for**: Clean, professional look

#### **dracula**
- **Type**: Dark
- **Accent**: Purple/Pink
- **Style**: Vibrant, high contrast
- **Best for**: Creative work, standing out

#### **material**
- **Type**: Dark
- **Accent**: Various (Google Material)
- **Style**: Modern, Google Material Design
- **Best for**: Modern applications, UI consistency

### Light Themes

#### **one_light**
- **Type**: Light
- **Accent**: Blue
- **Style**: Clean, bright
- **Best for**: Daytime coding, presentations

#### **gruvbox_light**
- **Type**: Light
- **Accent**: Orange/Yellow
- **Style**: Warm, retro
- **Best for**: Comfortable light theme

#### **material_light**
- **Type**: Light
- **Accent**: Various
- **Style**: Google Material Design
- **Best for**: Modern light interface

### Specialty Themes

#### **everforest**
- **Type**: Dark/Light variants
- **Accent**: Green
- **Style**: Forest-inspired, natural
- **Best for**: Nature lovers, green accent preference

#### **nightfox**
- **Type**: Dark
- **Accent**: Purple/Orange
- **Style**: Vibrant, animal-inspired
- **Best for**: Unique color combinations

#### **kanagawa**
- **Type**: Dark
- **Accent**: Traditional Japanese colors
- **Style**: Inspired by Hokusai's "The Great Wave"
- **Best for**: Traditional, artistic feel

## 🔧 Theme Usage

### Setting Default Theme
```lua
-- In lua/chadrc.lua
M.base46 = {
  theme = "onedark",  -- Your chosen theme
}
```

### Theme Switching
```vim
" Command to switch themes
:Telescope themes

" Or use keybinding
<leader>th  " Opens theme picker
```

### Theme Toggle
```lua
-- In lua/chadrc.lua
M.base46 = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
}
```

## 🎨 Theme Previews

### Usage Commands
```vim
" Preview theme without applying
:lua require("base46").load_theme("theme_name")

" Open theme picker with live preview
:Telescope themes
```

### Theme Picker Features
- **Live preview**: See changes immediately
- **Search**: Filter themes by name
- **Favorites**: Mark preferred themes
- **Categories**: Group by type (dark/light)

## 🔍 Theme Details

### Theme Structure Information
Each theme contains:
- **base_30**: 30 color palette for UI elements
- **base_16**: 16 color palette for syntax highlighting
- **polish_hl**: Additional highlight customizations
- **type**: "dark" or "light"

### Color Palette Access
```lua
-- Get current theme colors
local colors = require("base46").get_theme_tb("base_30")
print(colors.red)    -- "#E06C75"
print(colors.green)  -- "#98C379"
print(colors.blue)   -- "#61AFEF"
```

## 🎯 Theme Customization

### Per-Theme Customization
```lua
-- In lua/chadrc.lua
M.base46 = {
  theme = "onedark",
  hl_override = {
    -- Only applies to current theme
    Comment = { italic = true },
    String = { fg = "#98C379" },
  },
}
```

### Multi-Theme Support
```lua
-- Different customizations for different themes
local theme_customizations = {
  onedark = {
    Comment = { italic = true, fg = "#7C7C7C" },
    String = { fg = "#98C379" },
  },
  one_light = {
    Comment = { italic = true, fg = "#A0A0A0" },
    String = { fg = "#50A14F" },
  },
}

M.base46 = {
  theme = "onedark",
  hl_override = theme_customizations["onedark"],
}
```

## 🔧 Theme Management

### Installed Themes Location
```
~/.local/share/nvim/lazy/base46/lua/base46/themes/
```

### Theme Files
- Each theme is a single Lua file
- Contains color definitions and highlight groups
- Can be modified directly (not recommended)

### Theme Backup
```bash
# Backup current theme configuration
cp ~/.config/nvim/lua/chadrc.lua ~/.config/nvim/chadrc.lua.backup
```

## 🎨 Creating Theme Variations

### Theme Modification
```lua
-- In lua/chadrc.lua
M.base46 = {
  theme = "onedark",
  hl_override = {
    -- Make your version of onedark
    Normal = { bg = "#1A1A1A" },  -- Darker background
    Comment = { fg = "#60A060" }, -- Green comments
    String = { fg = "#FFA500" },  -- Orange strings
  },
}
```

### Theme Mixing
```lua
-- Mix elements from different themes
M.base46 = {
  theme = "onedark",
  hl_override = {
    -- Use gruvbox-style colors on onedark base
    String = { fg = "#B8BB26" },      -- Gruvbox green
    Function = { fg = "#FABD2F" },    -- Gruvbox yellow
    Keyword = { fg = "#FB4934" },     -- Gruvbox red
  },
}
```

## 🔍 Theme Recommendations

### For Different Use Cases

#### **Web Development**
- **Dark**: `tokyonight`, `material`
- **Light**: `one_light`, `material_light`

#### **System Programming**
- **Dark**: `gruvbox`, `nord`
- **Light**: `gruvbox_light`

#### **Creative Work**
- **Dark**: `dracula`, `catppuccin`
- **Light**: `one_light`

#### **Data Science**
- **Dark**: `nord`, `onedark`
- **Light**: `material_light`

#### **Long Coding Sessions**
- **Dark**: `catppuccin`, `everforest`
- **Light**: `gruvbox_light`

### Time-Based Recommendations
```lua
-- Auto-switch based on time
local function get_time_theme()
  local hour = tonumber(os.date("%H"))
  if hour >= 6 and hour < 18 then
    return "one_light"      -- Daytime
  else
    return "onedark"        -- Evening/Night
  end
end
```

## 🔧 Theme Troubleshooting

### Common Issues

#### Theme Not Loading
```lua
-- Check if theme exists
local themes = require("base46").get_theme_tb("themes")
print(vim.inspect(themes))
```

#### Colors Not Updating
```lua
-- Force reload theme
require("base46").load_theme()
```

#### Plugin Conflicts
```lua
-- Reset highlights
vim.cmd("hi clear")
require("base46").load_theme("onedark")
```

### Debug Commands
```vim
" Check current colorscheme
:echo g:colors_name

" List all highlight groups
:highlight

" Show specific highlight
:highlight Normal
```

---

*With 68+ themes available, NvChad provides options for every preference and use case.*