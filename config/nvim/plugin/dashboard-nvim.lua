require('dashboard').setup({
  config = {
    -- footer = {
    --   '',
    --   '',
    --   'There is always another way'
    -- },
    header = {
      ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
      ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
      ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
      ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
      ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
      ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
      '',
      '',
    },
    project = { enable = false },
    shortcut = {
      { desc = ' Update', action = 'PackerUpdate', key = 'u' },
      {
        icon = ' ',
        -- icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' Apps',
        group = 'DiagnosticOk',
        action = 'Telescope app',
        key = 'a',
      },
      {
        desc = ' dotfiles',
        group = 'Number',
        action = 'Telescope dotfiles',
        key = 'd',
      },
    },
    week_header = {
      enable = false, -- if enabled overrides header setting
    },
  },
  hide = { 'statusline', 'tabline', 'winbar' },
  theme = 'hyper',
})

vim.api.nvim_command('autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2')
-- vim.api.nvim_command('autocmd FileType dashboard set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2')
-- vim.api.nvim_command('autocmd FileType dashboard set noruler | autocmd WinLeave <buffer> set ruler')
