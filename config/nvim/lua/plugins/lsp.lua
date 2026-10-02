-- language servers and the mason installs for every tool in languages.lua
-- mason package names that differ from the tool name; false skips mason
local mason_packages = {
  erb_lint = "erb-lint",
  golangcilint = "golangci-lint",
  ruby_lsp = false,
  ruff_format = "ruff",
}

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local languages = require("languages")
      local servers, installs = {}, {}

      for _, language in pairs(languages) do
        local names = vim.list_extend(
          vim.list_extend(vim.list_extend({}, language.tools or {}), language.linters or {}),
          language.formatters or {}
        )
        for server, overrides in pairs(language.lsp or {}) do
          servers[server] = overrides
          table.insert(names, server)
        end
        for _, name in ipairs(names) do
          local package = mason_packages[name]
          if package ~= false then
            installs[package or name] = true
          end
        end
      end

      require("mason").setup()
      -- servers are enabled below from languages.lua; automatic_enable would also
      -- start mason's rubocop/stylua/ruff packages as language servers
      require("mason-lspconfig").setup({ automatic_enable = false })
      require("mason-tool-installer").setup({
        ensure_installed = vim.tbl_keys(installs),
      })

      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })
      for server, overrides in pairs(servers) do
        if type(overrides) == "table" then
          vim.lsp.config(server, overrides)
        end
      end
      vim.lsp.enable(vim.tbl_keys(servers))

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          -- defaults: grn rename, gra code action, grr references,
          -- gri implementation, grt type definition, gO symbols, K hover
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        end,
      })

      require("lang-setup").setup()
    end,
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.diagnostic.config({
        float = { border = "rounded", source = true },
        severity_sort = true,
        virtual_text = { current_line = true },
      })
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
    end,
  },
}
