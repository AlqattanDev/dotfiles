local M = {}

-- Avante configuration with MCP integration
M.setup = function()
  require("avante").setup({
    -- Provider configuration - using Copilot as default
    provider = "copilot",
    auto_suggestions_provider = "copilot",
    
    providers = {
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        model = "gpt-4o-2024-08-06",
        proxy = nil,
        allow_insecure = true,
        timeout = 10000,
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },
    },

    -- Behaviour configuration
    behaviour = {
      auto_suggestions = true,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = true,
      support_paste_from_clipboard = true,
    },

    -- Key mappings
    mappings = {
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },

    -- UI configuration
    hints = { enabled = true },
    windows = {
      position = "right",
      wrap = true,
      width = 35, -- Slightly wider for MCP tool output
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },

    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },

    diff = {
      autojump = true,
      list_opener = "copen",
    },
  })

end

return M
