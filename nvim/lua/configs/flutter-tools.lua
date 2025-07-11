local options = {
  ui = {
    border = "rounded",
    notification_style = "nvim-notify",
  },
  decorations = {
    statusline = {
      app_version = false,
      device = true,
      project_config = false,
    }
  },
  debugger = {
    enabled = false, -- Disable DAP as requested
  },
  flutter_path = nil, -- Uses flutter from PATH
  flutter_lookup_cmd = nil, -- Uses which/where to find flutter
  fvm = false, -- Set to true if using FVM
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "ErrorMsg",
    prefix = "//",
    enabled = true
  },
  dev_log = {
    enabled = true,
    notify_errors = false,
    open_cmd = "tabedit",
  },
  dev_tools = {
    autostart = false,
    auto_open_browser = false,
  },
  outline = {
    open_cmd = "30vnew",
    auto_open = false
  },
  lsp = {
    color = {
      enabled = true,
      background = false,
      background_color = nil,
      foreground = false,
      virtual_text = true,
      virtual_text_str = "■",
    },
    on_attach = function(client, bufnr)
      -- You can add custom LSP keybindings here if needed
    end,
    capabilities = function(config)
      -- Merge with your existing LSP capabilities if any
      return config
    end,
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
        vim.fn.expand("$HOME/.pub-cache"),
        vim.fn.expand("$HOME/tools/flutter"),
      },
      renameFilesWithClasses = "prompt",
      enableSnippets = true,
      updateImportsOnRename = true,
    }
  }
}

return options
