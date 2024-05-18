-- faster window movement
local map_options = { noremap = true }
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", map_options)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", map_options)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", map_options)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", map_options)
vim.api.nvim_set_keymap("n", "<C-w>0", "<C-w>||<C-w>_", map_options)
