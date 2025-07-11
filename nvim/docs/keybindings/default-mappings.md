# NvChad Default Keybindings

Complete reference of all default keybindings in NvChad.

## 🎯 Essential Keybindings

### Leader Key
- **Leader**: `Space` (most important key in NvChad)

### Universal Actions
- **Command mode**: `;` (remapped from `:`)
- **Escape**: `jk` (insert mode)
- **Save**: `<Ctrl>s` (normal, insert, visual modes)

## 📁 File Operations

### File Management
- **Find files**: `<leader>ff` (Telescope find_files)
- **Find by grep**: `<leader>fg` (Telescope live_grep)
- **Find buffers**: `<leader>fb` (Telescope buffers)
- **Find help**: `<leader>fh` (Telescope help_tags)
- **Find recent**: `<leader>fo` (Telescope oldfiles)
- **Find marks**: `<leader>ma` (Telescope marks)

### File Tree (nvim-tree)
- **Toggle tree**: `<Ctrl>n`
- **Focus tree**: `<leader>e`

### Buffer Management
- **Next buffer**: `<Tab>`
- **Previous buffer**: `<S-Tab>`
- **Close buffer**: `<leader>x`
- **New buffer**: `<leader>b`

## 🔍 Search and Navigation

### Telescope (Fuzzy Finder)
- **Find files**: `<leader>ff`
- **Live grep**: `<leader>fg`
- **Buffers**: `<leader>fb`
- **Help tags**: `<leader>fh`
- **Old files**: `<leader>fo`
- **Colorscheme**: `<leader>th`
- **Keymaps**: `<leader>fk`

### Quick Navigation
- **Go to definition**: `gd` (LSP)
- **Go to declaration**: `gD` (LSP)
- **Go to implementation**: `gi` (LSP)
- **Go to type definition**: `<leader>D` (LSP)
- **Find references**: `gr` (LSP)

## 🎨 Theme and UI

### Theme Management
- **Theme picker**: `<leader>th`
- **Toggle theme**: `<leader>tt`

### UI Toggles
- **File tree**: `<Ctrl>n`
- **Cheatsheet**: `<leader>ch`
- **Terminal**: `<leader>h` (horizontal), `<leader>v` (vertical)

## 💻 Terminal Management

### Terminal Operations
- **Horizontal terminal**: `<leader>h`
- **Vertical terminal**: `<leader>v`
- **Float terminal**: `<leader>i`
- **Toggle terminal**: `<A-i>` (in terminal mode)
- **Terminal escape**: `<A-i>` (exit terminal mode)

### Terminal Navigation
- **Terminal left**: `<A-h>`
- **Terminal right**: `<A-l>`
- **Terminal up**: `<A-k>`
- **Terminal down**: `<A-j>`

## 🔧 Development Tools

### LSP (Language Server Protocol)
- **Hover documentation**: `K`
- **Signature help**: `<Ctrl>k`
- **Rename symbol**: `<leader>ra`
- **Code action**: `<leader>ca`
- **Format document**: `<leader>fm`
- **Line diagnostics**: `<leader>q`
- **Next diagnostic**: `]d`
- **Previous diagnostic**: `[d`

### Git Integration (Gitsigns)
- **Stage hunk**: `<leader>rh`
- **Reset hunk**: `<leader>ph`
- **Preview hunk**: `<leader>gb`
- **Blame line**: `<leader>td`
- **Toggle deleted**: `<leader>td`

## 🎯 Window Management

### Window Navigation
- **Left window**: `<Ctrl>h`
- **Right window**: `<Ctrl>l`
- **Up window**: `<Ctrl>k`
- **Down window**: `<Ctrl>j`

### Window Operations
- **Horizontal split**: `<leader>h`
- **Vertical split**: `<leader>v`
- **Close window**: `<leader>q`
- **Only window**: `<leader>o`

## ✏️ Text Editing

### Basic Editing
- **Line numbers**: `<leader>n`
- **Relative numbers**: `<leader>rn`
- **Wrap text**: `<leader>uw`
- **Spell check**: `<leader>us`

### Code Formatting
- **Format file**: `<leader>fm`
- **Format range**: `<leader>fm` (visual mode)

### Comment Operations
- **Toggle comment**: `<leader>/` (normal mode)
- **Toggle comment**: `<leader>/` (visual mode)

## 📋 Utility Functions

### System Operations
- **Cheatsheet**: `<leader>ch`
- **Neovim config**: `<leader>nv`
- **Reload config**: `<leader>rr`
- **Quit all**: `<leader>qa`

### Plugin Management
- **Lazy plugin manager**: `<leader>pm`
- **Mason LSP manager**: `<leader>lm`

## 🎪 Visual Mode Mappings

### Text Operations
- **Move line up**: `<A-k>`
- **Move line down**: `<A-j>`
- **Indent left**: `<`
- **Indent right**: `>`
- **Comment toggle**: `<leader>/`

### Copy/Paste
- **Copy to clipboard**: `<leader>y`
- **Paste from clipboard**: `<leader>p`

## 🔤 Insert Mode Mappings

### Navigation
- **Move left**: `<Ctrl>h`
- **Move right**: `<Ctrl>l`
- **Move up**: `<Ctrl>k`
- **Move down**: `<Ctrl>j`

### Quick Actions
- **Save**: `<Ctrl>s`
- **Escape**: `jk`
- **Beginning of line**: `<Ctrl>a`
- **End of line**: `<Ctrl>e`

## 🔧 Command Mode Mappings

### Navigation
- **Beginning**: `<Ctrl>a`
- **End**: `<Ctrl>e`
- **Word forward**: `<Ctrl>f`
- **Word backward**: `<Ctrl>b`

## 📱 Completion (nvim-cmp)

### Completion Navigation
- **Next item**: `<Ctrl>n`
- **Previous item**: `<Ctrl>p`
- **Select item**: `<CR>`
- **Complete**: `<Ctrl>Space>`
- **Abort**: `<Ctrl>e`

### Snippet Navigation
- **Next placeholder**: `<Tab>`
- **Previous placeholder**: `<S-Tab>`

## 🎯 Custom User Mappings

### Current Configuration
From your `lua/mappings.lua`:
```lua
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")  -- Commented out
```

## 🔍 Keybinding Categories

### File Operations (Leader + f)
- `ff` - Find files
- `fg` - Live grep
- `fb` - Buffers
- `fh` - Help tags
- `fo` - Old files
- `fk` - Keymaps

### Git Operations (Leader + g)
- `gb` - Git blame
- `gh` - Git hunk operations
- `gd` - Git diff
- `gs` - Git status

### LSP Operations (Leader + l)
- `la` - Code actions
- `ld` - Diagnostics
- `lf` - Format
- `li` - Info
- `lr` - Rename

### Terminal Operations (Leader + t)
- `th` - Horizontal terminal
- `tv` - Vertical terminal
- `tf` - Float terminal

## 🎨 Which-Key Integration

### Group Prefixes
- `<leader>f` - Find operations
- `<leader>g` - Git operations
- `<leader>l` - LSP operations
- `<leader>t` - Terminal/Theme operations
- `<leader>d` - Debug operations
- `<leader>r` - Refactor operations

## 🔧 Plugin-Specific Mappings

### Telescope
- `<leader>th` - Theme selector
- `<leader>ma` - Marks
- `<leader>cm` - Commands
- `<leader>gt` - Git status

### NvimTree
- `<Ctrl>n` - Toggle
- `<leader>e` - Focus

### Which-Key
- `<leader>wK` - Show all keymaps
- `<leader>wk` - Show which-key

---

*Use `:NvCheatsheet` to see all current keybindings in an organized, searchable format.*