require('indent_blankline').setup({
  char = '|',
  buftype_exclude = { 'terminal' },
  filetype_exclude =  { 'dashboard' },
  show_trailing_blankline_indent = false,
  use_treesitter = true,
})
