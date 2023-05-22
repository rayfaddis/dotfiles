local nvim_lsp = require("lspconfig")

-- Setup capabilities for autocomplete
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local function nmap(keyStroke, action, opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", keyStroke, action, opts or { noremap = true, silent = true })
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Normal mode key mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  nmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  -- nmap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  nmap("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  nmap("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  nmap("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  nmap("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  nmap("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  nmap("<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  nmap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  nmap("<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
  nmap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  nmap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  nmap("<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  nmap("<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")

  -- Auto format specific clients on save
  if TableContains({ "eslint", "lua_ls", "terraformls" }, client.name) then
    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
  end
end

local settings = {
  lua_ls = {
    Lua = {
      diagnostics = {
        globals = { "vim", "KB", "TableClone", "TableContains", "TableSpread" },
      },
    },
  },
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local clients = {
  bashls = true,
  eslint = true,
  lua_ls = true,
  solargraph = true,
  terraformls = true,
  tsserver = true,
}
for client, enabled in pairs(clients) do
  if enabled then
    nvim_lsp[client].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = settings[client],
    })
  end
end
