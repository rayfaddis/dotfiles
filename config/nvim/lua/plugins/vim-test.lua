local map_options = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>t', ':TestFile<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>s', ':TestNearest<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>l', ':TestLast<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>a', ':TestSuite<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>gt', ':TestVisit<CR>', map_options)

vim.g['test#strategy'] = 'make'
