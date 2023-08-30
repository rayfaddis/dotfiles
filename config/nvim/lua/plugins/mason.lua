return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      {
        "williamboman/mason-lspconfig"
      },
    },
    config = function(_, opts)
      require("mason").setup({opts})
      local clients = dofile(CWD() .. "lsp/clients.lua")

      local client_names = {}
      for client, _ in pairs(clients) do
        table.insert(client_names, client)
      end

      require("mason-lspconfig").setup({ ensure_installed = client_names })
    end,
    opts = {
      -- log_level = vim.log.levels.DEBUG, -- TRACE
    },
  },
}
