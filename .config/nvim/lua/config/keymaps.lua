-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
map("n", "<leader>ts", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "ToggleTerm split" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "ToggleTerm vertical" })
