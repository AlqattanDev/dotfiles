return {
  "ishiooon/ccmanager.nvim",
  dependencies = {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true
  },
  config = function()
    require("ccmanager").setup({
      -- your configuration
    })
  end,
  keys = {
    { "<leader>cm", desc = "Toggle CCManager" },
  },
}
