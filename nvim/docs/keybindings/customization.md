# Keybinding Customization

Complete guide to customizing keybindings in NvChad.

## 🎯 Customization Architecture

### Configuration Files
- **Primary**: `lua/mappings.lua` (user mappings)
- **Core**: `nvchad.mappings` (NvChad defaults)
- **Plugin**: Individual plugin configurations

### Override System
```lua
-- NvChad loads mappings in this order:
require "nvchad.mappings"  -- 1. Default mappings
-- Your mappings.lua       -- 2. User overrides (highest priority)
```

## 🔧 Basic Customization

### Adding New Keybindings
```lua
-- In lua/mappings.lua
require "nvchad.mappings"

local map = vim.keymap.set

-- Save file
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

-- Quick escape
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
```

### Overriding Default Mappings
```lua
-- Override existing NvChad mappings
map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle nvim-tree" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
```

## 🗑️ Removing Keybindings

### Delete Specific Mappings
```lua
-- Remove a mapping
vim.keymap.del("n", "<leader>h")
vim.keymap.del("i", "jk")
vim.keymap.del("v", "<leader>/")

-- Remove from specific buffer
vim.keymap.del("n", "<leader>t", { buffer = 0 })
```

### Disable Groups of Mappings
```lua
-- Disable all terminal mappings
local terminal_mappings = {
  "<leader>h",
  "<leader>v", 
  "<A-h>",
  "<A-v>",
  "<A-i>",
}

for _, mapping in ipairs(terminal_mappings) do
  vim.keymap.del("n", mapping)
end
```

## 🎨 Advanced Customization

### Mode-Specific Mappings
```lua
-- Normal mode only
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Insert mode only
map("i", "<C-s>", "<ESC><cmd>w<cr>", { desc = "Save and exit insert" })

-- Visual mode only
map("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })

-- Multiple modes
map({"n", "v"}, "<leader>d", "<cmd>bd<cr>", { desc = "Delete buffer" })
```

### Conditional Mappings
```lua
-- Only in Lua files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    map("n", "<leader>r", "<cmd>luafile %<cr>", { 
      desc = "Run Lua file", 
      buffer = true 
    })
  end,
})

-- Only in Git repositories
if vim.fn.isdirectory(".git") == 1 then
  map("n", "<leader>gs", "<cmd>Git status<cr>", { desc = "Git status" })
end
```

### Function Mappings
```lua
-- Map to Lua function
map("n", "<leader>x", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  print("Current file: " .. filename)
end, { desc = "Show current file" })

-- With parameters
map("n", "<leader>s", function()
  vim.cmd("split")
  vim.cmd("terminal")
end, { desc = "Split and open terminal" })
```

## 📋 Practical Examples

### File Operations
```lua
-- Enhanced file operations
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>fS", "<cmd>wa<cr>", { desc = "Save all files" })
map("n", "<leader>fd", "<cmd>bd<cr>", { desc = "Delete buffer" })
map("n", "<leader>fD", "<cmd>%bd|e#<cr>", { desc = "Delete all buffers except current" })
```

### Window Management
```lua
-- Custom window operations
map("n", "<leader>wh", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>wo", "<cmd>only<cr>", { desc = "Only current window" })
map("n", "<leader>wc", "<cmd>close<cr>", { desc = "Close window" })
map("n", "<leader>w=", "<C-w>=", { desc = "Resize windows equally" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
```

### Development Workflow
```lua
-- Custom development mappings
map("n", "<leader>ct", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Run test" })
map("n", "<leader>cT", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "Run all tests" })
map("n", "<leader>cd", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
map("n", "<leader>cD", "<cmd>lua require('dap').start_debugging()<cr>", { desc = "Start debugging" })
```

## 🔍 Which-Key Integration

### Defining Groups
```lua
local wk = require("which-key")

-- Define key groups
wk.register({
  ["<leader>f"] = {
    name = "File",
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
    n = { "<cmd>enew<cr>", "New file" },
    s = { "<cmd>w<cr>", "Save file" },
  },
  ["<leader>g"] = {
    name = "Git",
    s = { "<cmd>Git status<cr>", "Status" },
    c = { "<cmd>Git commit<cr>", "Commit" },
    p = { "<cmd>Git push<cr>", "Push" },
    l = { "<cmd>Git log<cr>", "Log" },
  },
  ["<leader>w"] = {
    name = "Window",
    h = { "<cmd>split<cr>", "Horizontal split" },
    v = { "<cmd>vsplit<cr>", "Vertical split" },
    o = { "<cmd>only<cr>", "Only current" },
    c = { "<cmd>close<cr>", "Close" },
  },
})
```

### Nested Groups
```lua
wk.register({
  ["<leader>"] = {
    f = {
      name = "Find",
      f = { "<cmd>Telescope find_files<cr>", "Files" },
      g = { "<cmd>Telescope live_grep<cr>", "Grep" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      s = {
        name = "Search",
        s = { "<cmd>Telescope grep_string<cr>", "String" },
        w = { "<cmd>Telescope grep_string<cr>", "Word" },
        r = { "<cmd>Telescope resume<cr>", "Resume" },
      },
    },
  },
})
```

## 🎯 Plugin-Specific Customization

### LSP Mappings
```lua
-- Custom LSP mappings
local function lsp_keymaps(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  
  map("n", "gd", vim.lsp.buf.definition, bufopts)
  map("n", "K", vim.lsp.buf.hover, bufopts)
  map("n", "gi", vim.lsp.buf.implementation, bufopts)
  map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  map("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  map("n", "gr", vim.lsp.buf.references, bufopts)
  map("n", "<leader>f", vim.lsp.buf.format, bufopts)
end

-- Use in LSP on_attach
local on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end
```

### Telescope Custom Mappings
```lua
-- Custom Telescope mappings
map("n", "<leader>fa", "<cmd>Telescope autocommands<cr>", { desc = "Auto commands" })
map("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
map("n", "<leader>fC", "<cmd>Telescope command_history<cr>", { desc = "Command history" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
map("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Marks" })
map("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", { desc = "Man pages" })
map("n", "<leader>fo", "<cmd>Telescope vim_options<cr>", { desc = "Options" })
map("n", "<leader>ft", "<cmd>Telescope filetypes<cr>", { desc = "File types" })
```

## 🔧 Terminal Customization

### Terminal Mappings
```lua
-- Custom terminal mappings
map("n", "<leader>th", function()
  vim.cmd("split")
  vim.cmd("terminal")
  vim.cmd("resize 15")
end, { desc = "Terminal horizontal" })

map("n", "<leader>tv", function()
  vim.cmd("vsplit")
  vim.cmd("terminal")
end, { desc = "Terminal vertical" })

map("n", "<leader>tf", function()
  vim.cmd("lua require('nvchad.term').toggle { pos = 'float', id = 'floatTerm' }")
end, { desc = "Terminal float" })

-- Terminal mode mappings
map("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Window left" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Window down" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Window up" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Window right" })
```

## 🎨 Visual Enhancements

### Better Visual Mode
```lua
-- Enhanced visual mode mappings
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })
map("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Move visual selection
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
```

### Search and Replace
```lua
-- Search and replace mappings
map("n", "<leader>sr", ":%s//g<Left><Left>", { desc = "Search and replace" })
map("v", "<leader>sr", ":s//g<Left><Left>", { desc = "Search and replace selection" })
map("n", "<leader>sR", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "Replace word under cursor" })
```

## 🔍 Debugging Keybindings

### Check Existing Mappings
```lua
-- Function to check current mappings
local function check_mapping(mode, key)
  local mappings = vim.api.nvim_get_keymap(mode)
  for _, mapping in ipairs(mappings) do
    if mapping.lhs == key then
      print(string.format("Mode: %s, Key: %s, RHS: %s", mode, key, mapping.rhs or "function"))
      return mapping
    end
  end
  print(string.format("No mapping found for %s in mode %s", key, mode))
  return nil
end

-- Usage
check_mapping("n", "<leader>ff")
```

### List All Custom Mappings
```lua
-- Function to list all custom mappings
local function list_custom_mappings()
  local modes = { "n", "i", "v", "x", "o", "t", "c" }
  for _, mode in ipairs(modes) do
    local mappings = vim.api.nvim_get_keymap(mode)
    print(string.format("=== %s MODE ===", mode:upper()))
    for _, mapping in ipairs(mappings) do
      if mapping.desc then
        print(string.format("%s -> %s", mapping.lhs, mapping.desc))
      end
    end
  end
end

-- Add to mappings.lua
map("n", "<leader>mk", list_custom_mappings, { desc = "List custom mappings" })
```

## 🎯 Best Practices

### Naming Conventions
- Use descriptive `desc` for all mappings
- Group related mappings with consistent prefixes
- Follow mnemonic patterns (f for find, g for git, etc.)

### Performance Considerations
- Use `lazy = true` for plugin mappings when possible
- Avoid mapping common keys unnecessarily
- Use buffer-local mappings for filetype-specific actions

### Organization
```lua
-- Good organization example
local map = vim.keymap.set

-- === GENERAL MAPPINGS ===
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- === FILE OPERATIONS ===
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

-- === WINDOW MANAGEMENT ===
map("n", "<leader>wh", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
```

---

*Well-organized keybindings make NvChad much more efficient and enjoyable to use.*