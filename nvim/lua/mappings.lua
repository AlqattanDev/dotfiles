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
map("n", "<leader>fD", ":FlutterDevices<CR>", { desc = "Flutter Devices" })
map("n", "<leader>fe", ":FlutterEmulators<CR>", { desc = "Flutter Emulators" })
map("n", "<leader>fh", ":FlutterReload<CR>", { desc = "Flutter Hot Reload" })
map("n", "<leader>fo", ":FlutterOutlineToggle<CR>", { desc = "Flutter Outline Toggle" })
map("n", "<leader>ft", ":FlutterDevTools<CR>", { desc = "Flutter Dev Tools" })
map("n", "<leader>fl", ":FlutterLogClear<CR>", { desc = "Flutter Log Clear" })

-- Avante AI Assistant mappings
map("n", "<leader>aa", ":AvanteAsk<CR>", { desc = "Avante Ask" })
map("v", "<leader>aa", ":AvanteAsk<CR>", { desc = "Avante Ask (selection)" })
map("n", "<leader>ar", ":AvanteRefresh<CR>", { desc = "Avante Refresh" })
map("n", "<leader>ae", ":AvanteEdit<CR>", { desc = "Avante Edit" })
map("n", "<leader>at", ":AvanteToggle<CR>", { desc = "Avante Toggle" })
map("n", "<leader>ac", ":AvanteClear<CR>", { desc = "Avante Clear" })

-- Avante + MCP Integration mappings
map("n", "<leader>am", ":AvanteMCP<CR>", { desc = "Avante MCP Tools" })
map("n", "<leader>aw", ":AvanteCostAnalysis<CR>", { desc = "AWS Cost Analysis" })
map("n", "<leader>as", ":AvanteSecurityCheck<CR>", { desc = "AWS Security Check" })
map("n", "<leader>ah", ":AvanteArchReview<CR>", { desc = "AWS Architecture Review" })
