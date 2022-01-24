vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = {
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}
vim.g.dashboard_custom_footer = { 'There is always another way'}

vim.api.nvim_command('autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2')
vim.api.nvim_command('autocmd FileType dashboard set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2')
vim.api.nvim_command('autocmd FileType dashboard set noruler | autocmd WinLeave <buffer> set ruler')

-- nmap <Leader>ss :<C-u>SessionSave<CR>
-- nmap <Leader>sl :<C-u>SessionLoad<CR>
local map_options = { noremap = true, silent = true }
vim.api.nvim_set_keymap(
  'n', '<leader>fh', ':DashboardFindHistory<CR>', map_options
)
vim.api.nvim_set_keymap(
  'n', '<leader>ff', ':DashboardFindFile<CR>', map_options
)
vim.api.nvim_set_keymap(
  'n', '<leader>tc', ':DashboardChangeColorscheme<CR>', map_options
)
vim.api.nvim_set_keymap(
  'n', '<leader>fa', ':DashboardFindWord<CR>', map_options
)
vim.api.nvim_set_keymap(
  'n', '<leader>fb', ':DashboardJumpMark<CR>', map_options
)
vim.api.nvim_set_keymap(
  'n', '<leader>cn', ':DashboardNewFile<CR>', map_options
)
