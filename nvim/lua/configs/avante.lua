local M = {}

-- Custom slash commands that integrate with MCP
local function setup_mcp_commands()
  -- AWS Cost Analysis slash command
  vim.api.nvim_create_user_command("AvanteCostAnalysis", function(opts)
    local mcphub = require("mcphub")
    local prompt = opts.args or "Analyze AWS costs for current project"
    
    -- Use MCP cost analysis tool
    mcphub.call_tool("awslabs.cost-analysis-mcp-server", "generate_cost_report", {
      service = "general",
      region = "us-east-1"
    }, function(result)
      -- Pass result to Avante for analysis
      vim.cmd("AvanteAsk Analyze this AWS cost data: " .. vim.json.encode(result))
    end)
  end, { nargs = "?", desc = "AWS Cost Analysis with Avante" })

  -- AWS Security Analysis slash command
  vim.api.nvim_create_user_command("AvanteSecurityCheck", function(opts)
    local mcphub = require("mcphub")
    local current_file = vim.fn.expand("%:p")
    
    -- Use MCP IAM tool for security analysis
    mcphub.call_tool("awslabs.iam-mcp-server", "get_managed_policy_document", {
      policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    }, function(result)
      vim.cmd("AvanteAsk Review this IAM policy for security best practices: " .. vim.json.encode(result))
    end)
  end, { desc = "AWS Security Check with Avante" })

  -- AWS Architecture Review slash command
  vim.api.nvim_create_user_command("AvanteArchReview", function(opts)
    local mcphub = require("mcphub")
    
    -- Use MCP core server for architecture guidance
    mcphub.call_tool("awslabs.core-mcp-server", "prompt_understanding", {
      prompt = "Review current AWS architecture for best practices and improvements"
    }, function(result)
      vim.cmd("AvanteAsk " .. result.guidance or "Provide AWS architecture review")
    end)
  end, { desc = "AWS Architecture Review with Avante" })
end

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
        allow_insecure = false,
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },
    },

    -- Behaviour configuration
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
    },

    -- Custom slash commands
    slash_commands = {
      {
        command = "cost",
        description = "Analyze AWS costs using MCP",
        callback = function()
          vim.cmd("AvanteCostAnalysis")
        end,
      },
      {
        command = "security",
        description = "Check AWS security with MCP",
        callback = function()
          vim.cmd("AvanteSecurityCheck")
        end,
      },
      {
        command = "arch",
        description = "Review AWS architecture with MCP",
        callback = function()
          vim.cmd("AvanteArchReview")
        end,
      },
      {
        command = "mcp",
        description = "List available MCP tools",
        callback = function()
          local mcphub = require("mcphub")
          local tools = mcphub.list_tools()
          local tool_list = "Available MCP tools:\n"
          for _, tool in ipairs(tools) do
            tool_list = tool_list .. "- " .. tool.name .. ": " .. tool.description .. "\n"
          end
          vim.cmd("AvanteAsk " .. tool_list)
        end,
      },
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

  -- Setup MCP integration commands
  setup_mcp_commands()
end

return M
