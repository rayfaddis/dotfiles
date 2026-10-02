-- Per-language tooling, keyed by filetype. Every field is optional.
--   parsers        extra treesitter parsers (the filetype's own parser auto-installs)
--   lsp            { server = true | vim.lsp.config overrides } (nvim-lspconfig names)
--   linters        nvim-lint names
--   formatters     conform names
--   tools          extra mason packages that a server picks up from PATH
--   format_on_save defaults to true when formatters are set; LSP formats when none are
--
-- Server list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- Linters: https://github.com/mfussenegger/nvim-lint#available-linters
-- Formatters: https://github.com/stevearc/conform.nvim#formatters

local javascript = {
  lsp = { ts_ls = true, eslint = true },
  formatters = { "prettierd" },
}

local shell = {
  lsp = { bashls = true },
  tools = { "shellcheck" },
  formatters = { "shfmt" },
}

return {
  bash = shell,
  eruby = {
    parsers = { "html", "ruby" },
    lsp = { herb_ls = true },
    linters = { "erb_lint" },
  },
  go = {
    lsp = { gopls = true },
    linters = { "golangcilint" },
    formatters = { "goimports" },
  },
  javascript = javascript,
  javascriptreact = javascript,
  json = {
    lsp = { jsonls = true },
  },
  lua = {
    lsp = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
          },
        },
      },
    },
    formatters = { "stylua" },
  },
  markdown = {
    linters = { "markdownlint-cli2" },
  },
  python = {
    lsp = { pyright = true },
    linters = { "ruff" },
    formatters = { "ruff_format" },
  },
  -- ruby-lsp runs the project's bundled rubocop for diagnostics and formatting
  ruby = {
    lsp = {
      -- the gem comes from ~/.default-gems for each Ruby, not mason; mason's copy is
      -- pinned to the Ruby that installed it and fails on projects pinned to another
      ruby_lsp = {
        cmd = function(dispatchers, config)
          local cmd = vim.fn.executable("mise") == 1 and { "mise", "x", "--", "ruby-lsp" }
            or { "ruby-lsp" }
          return vim.lsp.rpc.start(cmd, dispatchers, { cwd = config.root_dir })
        end,
      },
    },
    format_on_save = true,
  },
  sh = shell,
  terraform = {
    lsp = { terraformls = true },
    linters = { "tflint" },
    format_on_save = true,
  },
  typescript = javascript,
  typescriptreact = javascript,
  yaml = {
    lsp = { yamlls = true },
  },
}
