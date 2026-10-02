-- syntax highlighting; parsers install the first time a filetype is opened
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      local languages = require("languages")
      local available = nil

      if vim.fn.executable("tree-sitter") == 0 then
        vim.notify(
          "tree-sitter CLI not found, parsers can't be installed: brew install tree-sitter-cli",
          vim.log.levels.WARN
        )
      end

      vim.treesitter.language.register("embedded_template", "eruby")

      local function start(buf, lang)
        if vim.api.nvim_buf_is_valid(buf) and pcall(vim.treesitter.start, buf, lang) then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", {}),
        callback = function(event)
          local lang = vim.treesitter.language.get_lang(event.match) or event.match
          local language = languages[event.match] or {}
          available = available or treesitter.get_available()
          local installed = treesitter.get_installed()

          local missing = vim.tbl_filter(function(parser)
            return vim.list_contains(available, parser)
              and not vim.list_contains(installed, parser)
          end, { lang, unpack(language.parsers or {}) })

          if #missing == 0 then
            start(event.buf, lang)
          else
            treesitter.install(missing):await(function()
              vim.schedule(function() start(event.buf, lang) end)
            end)
          end
        end,
      })
    end,
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    lazy = false,
  },
}
