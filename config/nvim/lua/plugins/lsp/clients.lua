return {
  bashls = {},
  eslint_d = {
    auto_format = true,
    null_ls_sources = {
      code_actions = true,
      diagnostics = true,
    },
  },
  lua_ls = {
    auto_format = true,
    lspconfig_settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "KB", "TableClone", "TableContains", "TableSpread" },
        },
      },
    }
  },
  prettierd = {
    null_ls_sources = {
      formatting = true,
    },
  },
  rubocop = {
    null_ls_sources = {
      diagnostics = true,
      formatting = true,
    },
  },
  solargraph = {
    auto_format = true,
  },
  terraformls = {
    auto_format = true,
  },
  tsserver = {},
}
