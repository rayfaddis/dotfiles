local tree_cb = require('nvim-tree.config').nvim_tree_callback

local list = {
  { key = '<C-s>', cb = tree_cb('split') },
}

require('nvim-tree').setup({
  view = {
    mappings = {
      list = list
    }
  }
})

local map_options = { noremap = true }
vim.api.nvim_set_keymap('n', '<leader>k', ':NvimTreeToggle<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeFindFile<CR>', map_options)
