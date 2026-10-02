-- formatting, configured in languages.lua; :FormatToggle (buffer) or :FormatToggle! (global)
local function format_on_save(buf)
  if vim.g.disable_autoformat or vim.b[buf].disable_autoformat then
    return false
  end

  local language = require("languages")[vim.bo[buf].filetype] or {}
  if language.format_on_save == nil then
    return language.formatters ~= nil
  end
  return language.format_on_save
end

return {
  {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    init = function()
      vim.api.nvim_create_user_command("FormatToggle", function(args)
        local scope = args.bang and vim.g or vim.b
        scope.disable_autoformat = not scope.disable_autoformat
        vim.notify(
          (args.bang and "Global" or "Buffer")
            .. " format on save: "
            .. (scope.disable_autoformat and "off" or "on")
        )
      end, { bang = true })

      -- one autocmd so eslint fixes always land before the formatters run
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("UserFormatOnSave", {}),
        callback = function(args)
          if not format_on_save(args.buf) then
            return
          end
          -- buffer-local, defined by nvim-lspconfig when the eslint server attaches
          if vim.fn.exists(":LspEslintFixAll") == 2 then
            vim.cmd("LspEslintFixAll")
          end
          require("conform").format({ bufnr = args.buf, timeout_ms = 2000 })
        end,
      })
    end,
    keys = {
      {
        "<space>F",
        function()
          require("conform").format({ async = true })
        end,
        mode = { "n", "v" },
      },
    },
    opts = function()
      local formatters_by_ft = {}
      for filetype, language in pairs(require("languages")) do
        formatters_by_ft[filetype] = language.formatters
      end

      return {
        default_format_opts = { lsp_format = "fallback" },
        formatters_by_ft = formatters_by_ft,
      }
    end,
  },
}
