return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    {
      "nvim-lua/plenary.nvim"
    },
  },
  event = "BufEnter",
  lazy = true,
  opts = function()
    local clients = dofile(CWD() .. "lsp/clients.lua")
    local null_ls_builtins = require("null-ls.builtins")
    local builtins = {
      code_actions = null_ls_builtins.code_actions,
      completion = null_ls_builtins.completion,
      diagnostics = null_ls_builtins.diagnostics,
      formatting = null_ls_builtins.formatting,
      hover = null_ls_builtins.hover,
    }
    local sources = {}

    for client, config in pairs(clients) do
      local config_null_ls_sources = config.null_ls_sources

      if config_null_ls_sources then
        for builtin, null_ls_builtin in pairs(builtins) do
          if config_null_ls_sources[builtin] then
            table.insert(sources, null_ls_builtin[client])
          end
        end
      end
    end

    return {
      sources = sources
    }
  end,
}
