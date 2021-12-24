local lsp_config = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

lsp_config.pyright.setup({
  capabilities = capabilities
})
