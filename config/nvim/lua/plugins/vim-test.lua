vim.api.nvim_set_keymap(
  'n', '<leader>t', ':TestFile<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>s', ':TestNearest<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>l', ':TestLast<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>a', ':TestSuite<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>gt', ':TestVisit<CR>', { noremap = true, silent = true }
)
