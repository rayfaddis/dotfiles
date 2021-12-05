local tree_cb = require("nvim-tree.config").nvim_tree_callback

local list = {
  { key = "<C-s>", cb = tree_cb("split") },
}

require('nvim-tree').setup {
  view = {
    mappings = {
      list = list
    }
  }
}

vim.api.nvim_set_keymap(
  'n', '<leader>k', ':NvimTreeToggle<CR>', { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>f', ':NvimTreeFindFile<CR>', { noremap = true }
)
