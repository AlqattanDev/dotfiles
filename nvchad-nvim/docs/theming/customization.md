# Theme Customization

Advanced guide to customizing themes in NvChad.

## 🎨 Customization Architecture

### Override System
```lua
-- In lua/chadrc.lua
M.base46 = {
  theme = "onedark",
  
  -- Override existing highlights
  hl_override = {
    Comment = { italic = true },
    String = { fg = "#98C379" },
  },
  
  -- Add new highlights
  hl_add = {
    MyCustomHighlight = { fg = "#FF6B6B", bg = "#1E1E1E" },
  },
}
```

### Customization Levels
1. **Theme selection**: Choose base theme
2. **Highlight override**: Modify existing highlights
3. **Highlight addition**: Add new highlights
4. **Custom theme**: Create entirely new theme

## 🔧 Highlight Overrides

### Basic Overrides
```lua
M.base46 = {
  theme = "onedark",
  hl_override = {
    -- Text styling
    Comment = { 
      italic = true, 
      fg = "#7C7C7C" 
    },
    String = { 
      fg = "#98C379",
      italic = true 
    },
    
    -- UI elements
    Normal = { 
      bg = "#1A1A1A" 
    },
    CursorLine = { 
      bg = "#2E2E2E" 
    },
    LineNr = { 
      fg = "#4B4B4B" 
    },
    
    -- Syntax highlighting
    Function = { 
      fg = "#61AFEF",
      bold = true 
    },
    Keyword = { 
      fg = "#C678DD",
      bold = true 
    },
    Type = { 
      fg = "#E5C07B" 
    },
    Variable = { 
      fg = "#E06C75" 
    },
  },
}
```

### TreeSitter Overrides
```lua
M.base46 = {
  hl_override = {
    -- TreeSitter highlights
    ["@variable"] = { fg = "#E5C07B" },
    ["@variable.builtin"] = { fg = "#E06C75" },
    ["@function"] = { fg = "#61AFEF", bold = true },
    ["@function.builtin"] = { fg = "#56B6C2" },
    ["@keyword"] = { fg = "#C678DD", bold = true },
    ["@keyword.function"] = { fg = "#C678DD" },
    ["@keyword.operator"] = { fg = "#C678DD" },
    ["@type"] = { fg = "#E5C07B" },
    ["@type.builtin"] = { fg = "#E5C07B" },
    ["@constructor"] = { fg = "#E5C07B" },
    ["@constant"] = { fg = "#D19A66" },
    ["@constant.builtin"] = { fg = "#D19A66" },
    ["@string"] = { fg = "#98C379" },
    ["@comment"] = { fg = "#7C7C7C", italic = true },
    ["@punctuation"] = { fg = "#ABB2BF" },
    ["@punctuation.bracket"] = { fg = "#ABB2BF" },
    ["@punctuation.delimiter"] = { fg = "#ABB2BF" },
    ["@operator"] = { fg = "#C678DD" },
    ["@parameter"] = { fg = "#E06C75" },
    ["@property"] = { fg = "#E06C75" },
    ["@field"] = { fg = "#E06C75" },
    ["@method"] = { fg = "#61AFEF" },
  },
}
```

### LSP Overrides
```lua
M.base46 = {
  hl_override = {
    -- LSP highlights
    DiagnosticError = { fg = "#E06C75" },
    DiagnosticWarn = { fg = "#E5C07B" },
    DiagnosticInfo = { fg = "#61AFEF" },
    DiagnosticHint = { fg = "#56B6C2" },
    
    -- LSP references
    LspReferenceText = { bg = "#3E4451" },
    LspReferenceRead = { bg = "#3E4451" },
    LspReferenceWrite = { bg = "#3E4451" },
    
    -- LSP signature
    LspSignatureActiveParameter = { bg = "#3E4451", bold = true },
  },
}
```

## 🎯 Plugin-Specific Customization

### NvimTree Customization
```lua
M.base46 = {
  hl_override = {
    -- NvimTree highlights
    NvimTreeNormal = { bg = "#1E1E1E" },
    NvimTreeNormalNC = { bg = "#1E1E1E" },
    NvimTreeEndOfBuffer = { bg = "#1E1E1E" },
    NvimTreeVertSplit = { bg = "#1E1E1E", fg = "#1E1E1E" },
    NvimTreeWinSeparator = { bg = "#1E1E1E", fg = "#1E1E1E" },
    
    -- File types
    NvimTreeFileIcon = { fg = "#61AFEF" },
    NvimTreeFolderIcon = { fg = "#E5C07B" },
    NvimTreeOpenedFolderName = { fg = "#98C379", bold = true },
    NvimTreeFolderName = { fg = "#61AFEF" },
    NvimTreeRootFolder = { fg = "#E06C75", bold = true },
    
    -- Git integration
    NvimTreeGitDirty = { fg = "#E5C07B" },
    NvimTreeGitStaged = { fg = "#98C379" },
    NvimTreeGitMerge = { fg = "#D19A66" },
    NvimTreeGitRenamed = { fg = "#C678DD" },
    NvimTreeGitNew = { fg = "#98C379" },
    NvimTreeGitDeleted = { fg = "#E06C75" },
  },
}
```

### Telescope Customization
```lua
M.base46 = {
  hl_override = {
    -- Telescope highlights
    TelescopeNormal = { bg = "#1E1E1E" },
    TelescopeBorder = { bg = "#1E1E1E", fg = "#3E4451" },
    TelescopePromptNormal = { bg = "#2E2E2E" },
    TelescopePromptBorder = { bg = "#2E2E2E", fg = "#3E4451" },
    TelescopePromptTitle = { bg = "#E06C75", fg = "#1E1E1E" },
    TelescopePreviewTitle = { bg = "#98C379", fg = "#1E1E1E" },
    TelescopeResultsTitle = { bg = "#61AFEF", fg = "#1E1E1E" },
    TelescopeSelection = { bg = "#3E4451" },
    TelescopeSelectionCaret = { fg = "#E06C75" },
    TelescopeMatching = { fg = "#E5C07B", bold = true },
  },
}
```

### Status Line Customization
```lua
M.base46 = {
  hl_override = {
    -- Status line highlights
    St_NormalMode = { bg = "#98C379", fg = "#1E1E1E", bold = true },
    St_InsertMode = { bg = "#61AFEF", fg = "#1E1E1E", bold = true },
    St_VisualMode = { bg = "#C678DD", fg = "#1E1E1E", bold = true },
    St_ReplaceMode = { bg = "#E06C75", fg = "#1E1E1E", bold = true },
    St_CommandMode = { bg = "#E5C07B", fg = "#1E1E1E", bold = true },
    St_TerminalMode = { bg = "#56B6C2", fg = "#1E1E1E", bold = true },
    
    -- File info
    St_file_info = { bg = "#3E4451", fg = "#ABB2BF" },
    St_file_sep = { bg = "#3E4451", fg = "#3E4451" },
    
    -- Git info
    St_gitIcons = { bg = "#3E4451", fg = "#E5C07B" },
    
    -- LSP info
    St_LspStatus = { bg = "#3E4451", fg = "#61AFEF" },
    St_LspProgress = { bg = "#3E4451", fg = "#98C379" },
    St_LspStatus_Icon = { bg = "#3E4451", fg = "#61AFEF" },
  },
}
```

## 🔧 Advanced Customization

### Color Palette Modification
```lua
-- Get current theme colors
local colors = require("base46").get_theme_tb("base_30")

-- Custom color palette
local custom_colors = {
  red = "#FF6B6B",
  green = "#51CF66",
  blue = "#339AF0",
  yellow = "#FFD43B",
  purple = "#9775FA",
  orange = "#FF8C42",
  cyan = "#3BC9DB",
}

M.base46 = {
  theme = "onedark",
  hl_override = {
    -- Use custom colors
    String = { fg = custom_colors.green },
    Function = { fg = custom_colors.blue },
    Keyword = { fg = custom_colors.purple },
    Type = { fg = custom_colors.yellow },
    Error = { fg = custom_colors.red },
    Warning = { fg = custom_colors.orange },
    Info = { fg = custom_colors.cyan },
  },
}
```

### Conditional Customization
```lua
-- Different customizations for different themes
local function get_theme_overrides(theme_name)
  local overrides = {
    onedark = {
      Comment = { italic = true, fg = "#7C7C7C" },
      String = { fg = "#98C379" },
    },
    one_light = {
      Comment = { italic = true, fg = "#A0A0A0" },
      String = { fg = "#50A14F" },
    },
    gruvbox = {
      Comment = { italic = true, fg = "#928374" },
      String = { fg = "#B8BB26" },
    },
  }
  
  return overrides[theme_name] or {}
end

M.base46 = {
  theme = "onedark",
  hl_override = get_theme_overrides("onedark"),
}
```

### Dynamic Customization
```lua
-- Time-based customization
local function get_time_overrides()
  local hour = tonumber(os.date("%H"))
  
  if hour >= 6 and hour < 18 then
    -- Daytime - higher contrast
    return {
      Normal = { bg = "#FFFFFF", fg = "#000000" },
      Comment = { fg = "#6A6A6A" },
    }
  else
    -- Nighttime - lower contrast
    return {
      Normal = { bg = "#1A1A1A", fg = "#E0E0E0" },
      Comment = { fg = "#808080" },
    }
  end
end

M.base46 = {
  theme = "onedark",
  hl_override = get_time_overrides(),
}
```

## 🎨 Creative Customizations

### Neon Theme
```lua
M.base46 = {
  theme = "onedark",
  hl_override = {
    -- Neon colors
    Normal = { bg = "#0D0D0D" },
    String = { fg = "#00FF41" },
    Function = { fg = "#00BFFF" },
    Keyword = { fg = "#FF1493" },
    Type = { fg = "#FFD700" },
    Variable = { fg = "#FF6347" },
    Comment = { fg = "#40E0D0", italic = true },
    
    -- Glowing effects
    CursorLine = { bg = "#1A1A1A" },
    Visual = { bg = "#FF1493", fg = "#000000" },
    Search = { bg = "#00FF41", fg = "#000000" },
  },
}
```

### Pastel Theme
```lua
M.base46 = {
  theme = "onedark",
  hl_override = {
    -- Soft pastel colors
    Normal = { bg = "#F8F8F8" },
    String = { fg = "#A8E6CF" },
    Function = { fg = "#FFB3E6" },
    Keyword = { fg = "#FFDAB9" },
    Type = { fg = "#E6E6FA" },
    Variable = { fg = "#F0E68C" },
    Comment = { fg = "#D3D3D3", italic = true },
    
    -- Soft UI
    CursorLine = { bg = "#F0F0F0" },
    Visual = { bg = "#E6E6FA" },
    Search = { bg = "#FFB3E6" },
  },
}
```

### High Contrast Theme
```lua
M.base46 = {
  theme = "onedark",
  hl_override = {
    -- High contrast colors
    Normal = { bg = "#000000", fg = "#FFFFFF" },
    String = { fg = "#00FF00", bold = true },
    Function = { fg = "#0080FF", bold = true },
    Keyword = { fg = "#FF0080", bold = true },
    Type = { fg = "#FFFF00", bold = true },
    Variable = { fg = "#FF8000", bold = true },
    Comment = { fg = "#808080", italic = true },
    
    -- Strong UI contrast
    CursorLine = { bg = "#333333" },
    Visual = { bg = "#FFFFFF", fg = "#000000" },
    Search = { bg = "#FFFF00", fg = "#000000" },
  },
}
```

## 🔍 Testing Customizations

### Live Testing
```lua
-- Test highlight changes live
vim.cmd("highlight String guifg=#FF6B6B")
vim.cmd("highlight Function guifg=#61AFEF gui=bold")
```

### Validation
```lua
-- Check if highlight exists
local function highlight_exists(group)
  local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
  return ok and next(hl) ~= nil
end

-- Usage
if highlight_exists("MyCustomHighlight") then
  print("Highlight exists")
end
```

### Debug Helpers
```lua
-- Print current highlight under cursor
local function print_highlight_under_cursor()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local hi_name = vim.fn.synIDattr(vim.fn.synID(line, col, 1), "name")
  print("Highlight: " .. hi_name)
end

-- Map to key
vim.keymap.set("n", "<leader>hi", print_highlight_under_cursor, 
  { desc = "Print highlight under cursor" })
```

---

*Theme customization allows you to create a truly personalized coding environment that matches your style and preferences.*