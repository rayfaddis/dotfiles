require('tabby').setup({
   -- tabline = require('tabby.presets').active_wins_at_tail,
   -- tabline = require('tabby.presets').active_tab_with_wins,
   tabline = require('tabby.presets').tab_only,
})

local map_options = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>1', '<Cmd>tabn 1<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>2', '<Cmd>tabn 2<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>3', '<Cmd>tabn 3<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>4', '<Cmd>tabn 4<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>5', '<Cmd>tabn 5<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>6', '<Cmd>tabn 6<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>7', '<Cmd>tabn 7<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>8', '<Cmd>tabn 8<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>9', '<Cmd>tabn 9<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>0', '<Cmd>tabn 0<CR>', map_options)
