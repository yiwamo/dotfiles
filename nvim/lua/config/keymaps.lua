-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader><leader>t", ":tabedit ~/.dotmemo/TODO.md<CR>", { desc = "Open TODO" })
vim.keymap.set("n", "<leader><leader>c", ":tabedit ~/.dotmemo/nvim/CHEATSHEET.md<CR>", { desc = "Open VimCheatSheet" })
