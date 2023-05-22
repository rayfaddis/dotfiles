local width = 75

-- local nvim_tree_events = require('nvim-tree.events')
-- local bufferline_state = require('bufferline.state')
-- nvim_tree_events.on_tree_open(function ()
--   bufferline_state.set_offset(width, "File Tree")
-- end)
-- nvim_tree_events.on_tree_close(function ()
--   bufferline_state.set_offset(0)
-- end)

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
    enable = true,
  },
  view = {
    width = width,
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
