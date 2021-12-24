local lsp_config = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

lsp_config.solargraph.setup({
  capabilities = capabilities,
  on_attach = function()
    -- format on save
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
})
