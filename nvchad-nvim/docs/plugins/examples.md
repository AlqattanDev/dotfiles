# Plugin Configuration Examples

Real-world examples of common plugin configurations in NvChad.

## 🎨 Theme and UI Plugins

### Theme Switcher Plugin
```lua
{
  "zaldih/themery.nvim",
  cmd = "Themery",
  config = function()
    require("themery").setup({
      themes = {
        "onedark",
        "gruvbox",
        "tokyonight",
        "catppuccin",
      },
      livePreview = true,
    })
  end,
}
```

### Status Line Enhancement
```lua
{
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
        lualine_x = {{require('mcphub.extensions.lualine')},},
      },
    })
  end,
}
```

## 📝 Editor Enhancement Plugins

### Better Comment Plugin
```lua
{
  "numToStr/Comment.nvim",
  keys = {
    { "gcc", mode = "n", desc = "Comment toggle current line" },
    { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
    { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
  },
  config = function()
    require("Comment").setup({
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
    })
  end,
}
```

### Surround Plugin
```lua
{
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
      },
    })
  end,
}
```

### Multiple Cursors
```lua
{
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",
      ["Find Subword Under"] = "<C-d>",
      ["Select Cursor Down"] = "<M-C-Down>",
      ["Select Cursor Up"] = "<M-C-Up>",
    }
  end,
}
```

## 🔧 Language Support Plugins

### TypeScript Support
```lua
{
  "pmizio/typescript-tools.nvim",
  ft = { "typescript", "typescriptreact" },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("typescript-tools").setup({
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
          },
        },
      },
    })
  end,
}
```

### Python Support
```lua
{
  "microsoft/python-type-stubs",
  ft = "python",
  build = function()
    vim.cmd("PyrightInstall")
  end,
}

{
  "linux-cultist/venv-selector.nvim",
  ft = "python",
  config = function()
    require("venv-selector").setup({
      pyenv_path = "~/.pyenv/versions",
    })
  end,
}
```

### Rust Support
```lua
{
  "mrcjkb/rustaceanvim",
  version = "^4",
  ft = "rust",
  config = function()
    vim.g.rustaceanvim = {
      server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      },
    }
  end,
}
```

## 🧪 Testing Plugins

### Test Runner
```lua
{
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python"),
        require("neotest-jest"),
      },
    })
  end,
}
```

### Code Coverage
```lua
{
  "andythigpen/nvim-coverage",
  dependencies = "nvim-lua/plenary.nvim",
  cmd = {
    "Coverage",
    "CoverageClear",
    "CoverageHide",
    "CoverageShow",
    "CoverageToggle",
  },
  config = function()
    require("coverage").setup({
      auto_reload = true,
      lang = {
        python = {
          coverage_file = "coverage.xml",
        },
      },
    })
  end,
}
```

## 🔍 Search and Navigation Plugins

### Better Search
```lua
{
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  config = function()
    require("spectre").setup({
      color_devicons = true,
      highlight = {
        ui = "String",
        search = "DiffChange",
        replace = "DiffDelete",
      },
    })
  end,
}
```

### File Browser
```lua
{
  "stevearc/oil.nvim",
  cmd = "Oil",
  config = function()
    require("oil").setup({
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-r>"] = "actions.refresh",
      },
    })
  end,
}
```

## 🎯 Productivity Plugins

### Session Management
```lua
{
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_session_use_git_branch = true,
    })
  end,
}
```

### Todo Comments
```lua
{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufRead",
  config = function()
    require("todo-comments").setup({
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    })
  end,
}
```

### Markdown Preview
```lua
{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = "markdown",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
  end,
}
```

## 🔧 Development Tools

### Database Client
```lua
{
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  config = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
  end,
}
```

### HTTP Client
```lua
{
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("rest-nvim").setup({
      result_split_horizontal = false,
      result_split_in_place = false,
      skip_ssl_verification = false,
      encode_url = true,
      highlight = {
        enabled = true,
        timeout = 150,
      },
    })
  end,
}
```

## 🎨 Customization Examples

### Custom Keybindings with Plugin
```lua
{
  "plugin-name",
  keys = {
    { "<leader>p", "<cmd>PluginCommand<cr>", desc = "Plugin action" },
    { "<leader>P", function() require("plugin").action() end, desc = "Plugin function" },
    { "<leader>pt", "<cmd>PluginToggle<cr>", desc = "Toggle plugin", mode = { "n", "v" } },
  },
  config = function()
    -- Plugin setup
  end,
}
```

### Conditional Plugin Loading
```lua
{
  "heavy-plugin",
  cond = function()
    return vim.fn.executable("required-tool") == 1
  end,
  config = function()
    -- Only loads if condition is met
  end,
}
```

### Plugin with Custom Commands
```lua
{
  "plugin-name",
  config = function()
    require("plugin-name").setup()
    
    -- Create custom commands
    vim.api.nvim_create_user_command("PluginCustom", function()
      require("plugin-name").custom_action()
    end, {})
  end,
}
```

---

*These examples demonstrate common plugin configurations that can be adapted for your specific needs.*
