-- manage LSP servers
return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      {
        "williamboman/mason-lspconfig",
      },
      {
        "jay-babu/mason-null-ls.nvim",
      },
    },
    config = function(_, opts)
      require("mason").setup({opts})
      local clients = dofile(CWD() .. "lsp/clients.lua")

      local lsp_clients = {}
      local null_ls_clients = {}
      for client, config in pairs(clients) do
        if not config.null_ls_sources then
          if config.null_ls_sources then
            print("test")
          end
          table.insert(lsp_clients, client)
        else
          table.insert(null_ls_clients, client)
        end
      end

      -- print("Mason Installs:")
      -- print("  LSP Clients: " .. table.concat(lsp_clients, ", "))
      -- print("  Null-ls Clients: " .. table.concat(null_ls_clients, ", "))

      require("mason-lspconfig").setup({ ensure_installed = lsp_clients })
      require("mason-null-ls").setup({ ensure_installed = null_ls_clients })
    end,
    opts = {
      -- log_level = vim.log.levels.DEBUG, -- TRACE
    },
  },
}
