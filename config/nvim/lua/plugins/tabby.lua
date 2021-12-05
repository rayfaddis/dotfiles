require("tabby").setup {
  tabline = require("tabby.presets").active_wins_at_tail,
}

vim.api.nvim_set_keymap(
  'n', '<leader>1', '<Cmd>tabn 1<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>2', '<Cmd>tabn 2<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>3', '<Cmd>tabn 3<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>4', '<Cmd>tabn 4<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>5', '<Cmd>tabn 5<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>6', '<Cmd>tabn 6<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>7', '<Cmd>tabn 7<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>8', '<Cmd>tabn 8<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>9', '<Cmd>tabn 9<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>0', '<Cmd>tabn 0<CR>', { noremap = true, silent = true }
)
