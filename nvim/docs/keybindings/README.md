# NvChad Keybindings System

Complete guide to understanding and customizing NvChad's keybinding system.

## 🎯 Keybinding Architecture

### Key Symbols
- `<leader>` = Space (default leader key)
- `<C>` = Ctrl
- `<A>` = Alt
- `<S>` = Shift
- `<M>` = Meta (Cmd on Mac)

### Keybinding Structure
```lua
vim.keymap.set("mode", "keymap", "action", { desc = "Description" })
```

## 🔧 Built-in Keybinding System

### Default Mappings Location
- **NvChad defaults**: `require "nvchad.mappings"`
- **User overrides**: `lua/mappings.lua`
- **Plugin mappings**: Defined in plugin configurations

### Mapping Priority
1. **User mappings** (highest priority)
2. **Plugin-specific mappings**
3. **NvChad default mappings**
4. **Neovim defaults** (lowest priority)

## 📋 Accessing Keybindings

### View All Keybindings
```vim
:NvCheatsheet           " NvChad's auto-generated cheatsheet
:Telescope keymaps      " Search through all keymaps
:map                    " Show all mappings
:nmap                   " Show normal mode mappings
:imap                   " Show insert mode mappings
:vmap                   " Show visual mode mappings
```

### Cheatsheet Features
- **Auto-generated**: From your actual keybindings
- **Categorized**: Grouped by functionality
- **Searchable**: Filter by category or key
- **Live updates**: Reflects current configuration

## 🎨 Keybinding Categories

### File Operations
- Find and manage files
- Buffer operations
- Project navigation

### Editor Functions
- Text manipulation
- Search and replace
- Code formatting

### Development Tools
- LSP operations
- Git integration
- Terminal management

### UI Controls
- Theme switching
- Panel toggles
- Window management

## 🛠️ Customization System

### Adding New Keybindings
```lua
-- In lua/mappings.lua
local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
```

### Overriding Default Mappings
```lua
-- Override NvChad defaults
map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
```

### Removing Mappings
```lua
-- Remove specific mapping
vim.keymap.del("n", "<leader>x")

-- Remove in insert mode
vim.keymap.del("i", "jk")
```

## 🔍 Modes and Contexts

### Mapping Modes
- **"n"**: Normal mode
- **"i"**: Insert mode
- **"v"**: Visual mode
- **"x"**: Visual block mode
- **"t"**: Terminal mode
- **"c"**: Command mode
- **{"n", "v"}**: Multiple modes

### Mode Examples
```lua
-- Normal mode only
map("n", "<leader>q", "<cmd>q<cr>")

-- Insert mode only
map("i", "<C-s>", "<ESC><cmd>w<cr>")

-- Visual mode only
map("v", "<leader>y", '"+y')

-- Multiple modes
map({"n", "v"}, "<leader>d", "<cmd>bd<cr>")
```

## 🎛️ Advanced Configuration

### Conditional Mappings
```lua
-- Only in specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    map("n", "<leader>r", "<cmd>luafile %<cr>", { desc = "Run lua file", buffer = true })
  end,
})
```

### Buffer-specific Mappings
```lua
-- Only for current buffer
map("n", "<leader>t", "<cmd>TestFile<cr>", { desc = "Test file", buffer = true })
```

### Function Mappings
```lua
-- Map to Lua function
map("n", "<leader>x", function()
  print("Custom function executed")
end, { desc = "Custom function" })
```

## 📱 Integration with Which-Key

### Which-Key Groups
```lua
local wk = require("which-key")

wk.register({
  ["<leader>f"] = {
    name = "Find",
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  },
  ["<leader>g"] = {
    name = "Git",
    s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
    u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo stage hunk" },
    r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
  },
})
```

### Automatic Registration
```lua
-- Which-key automatically picks up mappings with desc
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
-- This will appear in which-key popup
```

## 🔧 Plugin-Specific Mappings

### LSP Mappings
```lua
-- In an LSP on_attach function
local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, desc = "LSP: " }
  
  map("n", "gd", vim.lsp.buf.definition, opts .. "Go to definition")
  map("n", "K", vim.lsp.buf.hover, opts .. "Hover documentation")
  map("n", "<leader>rn", vim.lsp.buf.rename, opts .. "Rename symbol")
end
```

### Telescope Mappings
```lua
-- Custom telescope mappings
map("n", "<leader>ft", "<cmd>Telescope themes<cr>", { desc = "Find themes" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })
```

## 🎯 Best Practices

### Keybinding Design
- **Consistent prefixes**: Use logical grouping
- **Memorable mnemonics**: Easy to remember
- **Avoid conflicts**: Check existing mappings
- **Document everything**: Use desc parameter

### Organization Tips
```lua
-- Group related mappings
local map = vim.keymap.set

-- File operations
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })

-- Git operations
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo stage" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
```

## 🔍 Troubleshooting

### Common Issues
- **Mapping conflicts**: Use `:verbose map <key>` to check
- **Mode confusion**: Ensure correct mode specified
- **Plugin conflicts**: Check plugin documentation

### Debug Commands
```vim
:verbose map <leader>f    " Show mapping details
:map <leader>             " Show all leader mappings
:map <C-                  " Show all Ctrl mappings
```

### Testing Mappings
```lua
-- Test mapping in command mode
:lua vim.keymap.set("n", "<leader>test", function() print("Test successful") end)
```

---

*Understanding the keybinding system is crucial for customizing NvChad to match your workflow perfectly.*