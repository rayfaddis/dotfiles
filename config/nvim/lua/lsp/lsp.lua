-- local navic = require('nvim-navic')
--
-- require('lspconfig').clangd.setup {
--   on_attach = function(client, bufnr)
--     navic.attach(client, bufnr)
--   end
-- }

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local map_options = { silent = true, noremap = true }
vim.api.nvim_set_keymap(
  'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_options
)
vim.api.nvim_set_keymap(
  'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', map_options
)
vim.api.nvim_set_keymap(
  'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', map_options
)
vim.api.nvim_set_keymap(
  'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', map_options
)
vim.api.nvim_set_keymap(
  'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', map_options
)
vim.api.nvim_set_keymap(
  'n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', map_options
)
-- " nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
-- nnoremap <silent> <[-d> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
-- nnoremap <silent> <]-d> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
-- vim.api.nvim_command('buffer Formatting lua vim.lsp.buf.formatting()')
-- vim.api.nvim_command('-buffer FormattingSync lua vim.lsp.buf.formatting_sync()')
