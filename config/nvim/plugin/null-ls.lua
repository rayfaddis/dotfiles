local null_ls = require("null-ls")

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
-- local formatting = null_ls.builtins.formatting

local sources = {
  code_actions.cspell,
  code_actions.gitsigns,
  diagnostics.cspell,
  diagnostics.rubocop,
}

null_ls.setup({
  sources = sources,
})
