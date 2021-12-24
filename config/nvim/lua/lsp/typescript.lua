local lspconfig = require("lspconfig")
local nvim_lsp_ts_utils = require("nvim-lsp-ts-utils")

lspconfig.tsserver.setup({
  init_options = nvim_lsp_ts_utils.init_options,
  on_attach = function(client, bufnr)
    nvim_lsp_ts_utils.setup({
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,

      -- import all
      import_all_timeout = 5000, -- ms
      -- lower numbers = higher priority
      import_all_priorities = {
        same_file = 1, -- add to existing import statement
        local_files = 2, -- git files or files with relative path markers
        buffer_content = 3, -- loaded buffer content
        buffers = 4, -- loaded buffer names
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,

      -- filter diagnostics
      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},

      -- inlay hints
      auto_inlay_hints = true,
      inlay_hints_highlight = "Comment",

      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil,
    })

    -- required to fix code action ranges and filter diagnostics
    nvim_lsp_ts_utils.setup_client(client)

    -- no default maps, so you may want to define some here
    local opts = { silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
  end,
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettier_d_slim,
  },
  on_attach = function()
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
})
-- local lsp_config = require('lspconfig')
-- local nvim_lsp_ts_utils = require("nvim-lsp-ts-utils")
--
-- local buf_map = function(bufnr, mode, lhs, rhs, opts)
--   vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
--       silent = true,
--   })
-- end
--
-- lsp_config.tsserver.setup({
--   on_attach = function(client, bufnr)
--     client.resolved_capabilities.document_formatting = false
--     client.resolved_capabilities.document_range_formatting = false
--
--     nvim_lsp_ts_utils.setup({
--       eslint_bin = "eslint_d",
--       eslint_enable_diagnostics = true,
--       eslint_enable_code_actions = true,
--       enable_formatting = true,
--       formatter = "prettier_d_slim",
--     }
--     nvim_lsp_ts_utils.setup_client(client)
--
--     buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
--     buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
--     buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
--
--     -- format on save
--     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--   end
-- }
--
-- lsp_config["null-ls"].setup({
--   on_attach = function()
--     -- format on save
--     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--   end
-- })
