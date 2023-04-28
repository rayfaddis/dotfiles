local lsp_config = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

lsp_config.jsonls.setup({
  capabilities = capabilities,
  on_attach = function()
    require('nvim-navic').attach(client, bufnr)
    
    -- format on save
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
  end
})
