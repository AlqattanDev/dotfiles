return {
  --{ "stevearc/conform.nvim",
  --  -- event = 'BufWritePre', -- uncomment for format on save
  --  opts = require "configs.conform",
  --},

  ---- These are some examples, uncomment them if you want to see them work!
  --{
  --  "neovim/nvim-lspconfig",
  --  config = function()
  --    require "configs.lspconfig"
  --  end,
  --},


  { import = "nvchad.blink.lazyspec" },

  ---- nvim-tree configuration override
  --{
  --  "nvim-tree/nvim-tree.lua",
  --  opts = function()
  --    return require "configs.nvim-tree"
  --  end,
  --},

  -- Tmux integration for seamless navigation
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },


  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    build = function()
      -- Check if mcp-hub is already installed
      if vim.fn.executable("mcp-hub") == 0 then
        vim.notify("Installing mcp-hub locally...", vim.log.levels.INFO)
        -- Install locally in project's node_modules
        os.execute("npm install mcp-hub@^1.0.0")
      end
    end,
    config = function()
        require("mcphub").setup()
    end
  },
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
        lualine_x = { "encoding", "fileformat", "filetype", {require('mcphub.extensions.lualine')} },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
  },

  -- Flutter Development
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    ft = "dart",
    opts = require "configs.flutter-tools",
  },

  -- Copilot.lua for better integration with Avante
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true },
        panel = { enabled = true },
        server_opts_overrides = {
          settings = {
            advanced = {
              listCount = 5,
              inlineSuggestCount = 3,
            }
          }
        }
      })
    end,
  },

  -- Avante.nvim - AI coding assistant with slash commands
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- set this if you want to always pull the latest change
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and variables
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = true,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    config = function()
      require("configs.avante").setup()
    end,
  }
}
