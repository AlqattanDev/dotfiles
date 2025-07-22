require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- AI Copilot mappings (for copilot.lua integration)
map("n", "<leader>cp", ":Copilot panel<CR>", { desc = "Open Copilot panel" })
map("n", "<leader>cs", ":Copilot status<CR>", { desc = "Copilot status" })
map("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })
map("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })

-- Flutter mappings
map("n", "<leader>fr", ":FlutterRun<CR>", { desc = "Flutter Run" })
map("n", "<leader>fq", ":FlutterQuit<CR>", { desc = "Flutter Quit" })
map("n", "<leader>fR", ":FlutterRestart<CR>", { desc = "Flutter Restart" })
map("n", "<leader>fh", ":FlutterReload<CR>", { desc = "Flutter Hot Reload" })

-- Avante AI Assistant mappings
--map("n", "<leader>aa", ":AvanteAsk<CR>", { desc = "Avante Ask" })
--map("v", "<leader>aa", ":AvanteAsk<CR>", { desc = "Avante Ask (selection)" })
--map("n", "<leader>ar", ":AvanteRefresh<CR>", { desc = "Avante Refresh" })
--map("n", "<leader>ae", ":AvanteEdit<CR>", { desc = "Avante Edit" })
--map("n", "<leader>at", ":AvanteToggle<CR>", { desc = "Avante Toggle" })
--map("n", "<leader>ac", ":AvanteClear<CR>", { desc = "Avante Clear" })
