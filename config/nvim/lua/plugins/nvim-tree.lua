local tree_cb = require('nvim-tree.config').nvim_tree_callback

local list = {
  { key = '<C-s>', cb = tree_cb('split') },
}

require('nvim-tree').setup({
  diagnostics = {
    enable = false,
  },
  hijack_cursor = true,
  open_on_tab = false,
  update_focused_file = {
    enable = "true",
  },
  view = {
    width = 75,
    mappings = {
      list = list
    }
  },
})

-- vim.api.nvim_command('autocmd buffer NvimTree set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2')
-- vim.api.nvim_command('autocmd buffer NvimTree set noruler | autocmd WinLeave <buffer> set ruler')

local map_options = { noremap = true }
vim.api.nvim_set_keymap('n', '<leader>k', ':NvimTreeToggle<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeFindFile<CR>', map_options)
