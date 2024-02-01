-- nvim-lspconfig supported list https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
return {
  bashls = {},
  cspell = {
    null_ls_sources = {
      code_actions = true,
      diagnostics = true,
    },
  },
  eslint_d = {
    auto_format = true,
    null_ls_sources = {
      code_actions = true,
      diagnostics = true,
    },
  },
  golangci_lint_ls = {},
  lua_ls = {
    auto_format = true,
    lspconfig_setup = {
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              "vim",
              "KB",
              "TableClone",
              "TableContains",
              "TableSpread"
            },
          },
          runtime = {
            version = "LuaJIT"
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
          }
        },
      },
    },
  },
  prettierd = {
    null_ls_sources = {
      formatting = true,
    },
  },
  -- pylint = {
  --   auto_format = true,
  --   null_ls_sources = {
  --     diagnostics = true,
  --     formatting = true,
  --   },
  -- },
  pyright = {},
  solargraph = {
    auto_format = true,
  },
  terraformls = {
    auto_format = true,
  },
  tsserver = {},
}
