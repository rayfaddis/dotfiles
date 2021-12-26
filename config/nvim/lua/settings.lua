vim.g.mapleader = ' '
vim.g.colors_name = 'onedark'

--
-- NAVIGATION
--

-- open new split panes to right and bottom, which feels more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

--
-- EDITING
--

-- soft tabs of 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

--
-- STYLING
--

vim.opt.cursorline = true
vim.opt.termguicolors = true
-- nvim_create_augroup(
--   'colorextend',
--   {
--     'ColorScheme',
--     '*',
--     'call',
--     'onedark#set_highlight("Normal", { "bg": { "gui": #0a" } })'
--   }
-- )

-- display line numbers
vim.opt.number = true
vim.opt.numberwidth = 5

-- show whitespace characters
vim.opt.list = true
vim.opt.listchars = {
  tab = '▸\\',
  nbsp = '␣',
  lead = '·',
  trail = '·',
  extends = '→',
  precedes = '←',
  eol = '¬'
}
vim.opt.showbreak = 'i↪'

-- make it obvious where 80 characters is
vim.opt.textwidth = 80
vim.opt.colorcolumn = '+1'
