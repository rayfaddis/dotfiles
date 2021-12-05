require('fine-cmdline').setup({})

vim.api.nvim_set_keymap(
  'n', '<leader>p', ':lua require("fine-cmdline").open()<CR>', { noremap = true }
)
