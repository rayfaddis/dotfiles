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
-- nmap <Leader>ss :<C-u>SessionSave<CR>
-- nmap <Leader>sl :<C-u>SessionLoad<CR>
-- nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
-- nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
-- nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
-- nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
-- nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
-- nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
