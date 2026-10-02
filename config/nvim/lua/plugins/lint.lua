-- linters that aren't language servers, configured in languages.lua
local function gemfile_lock(buf)
  return vim.fs.find("Gemfile.lock", {
    path = vim.fs.dirname(vim.api.nvim_buf_get_name(buf)),
    upward = true,
  })[1]
end

local function bundles(lockfile, gem)
  for line in io.lines(lockfile) do
    if line:match("^    " .. vim.pesc(gem) .. " ") then
      return true
    end
  end
  return false
end

return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {}
      for filetype, language in pairs(require("languages")) do
        lint.linters_by_ft[filetype] = language.linters
      end

      -- the project's erb_lint (and its config) when bundled, otherwise mason's
      local erb_lint = lint.linters.erb_lint
      lint.linters.erb_lint = function()
        local linter = vim.deepcopy(type(erb_lint) == "function" and erb_lint() or erb_lint)
        local lockfile = gemfile_lock(0)
        local args = vim.tbl_filter(function(arg)
          return arg ~= "exec" and arg ~= "erblint" and arg ~= "erb_lint"
        end, linter.args)

        if lockfile and bundles(lockfile, "erb_lint") then
          linter.cmd = "bundle"
          linter.args = vim.list_extend({ "exec", "erb_lint" }, args)
          linter.cwd = vim.fs.dirname(lockfile)
        else
          linter.cmd = "erb_lint"
          linter.args = args
        end
        return linter
      end

      local function run()
        for _, name in ipairs(lint.linters_by_ft[vim.bo.filetype] or {}) do
          local linter = lint.linters[name]
          linter = type(linter) == "function" and linter() or linter
          -- skip until mason-tool-installer finishes installing it
          if vim.fn.executable(linter.cmd) == 1 then
            lint.try_lint(name)
          end
        end
      end

      -- FileType rather than BufReadPost, which fires before filetype detection
      vim.api.nvim_create_autocmd({ "FileType", "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("UserLint", {}),
        callback = run,
      })
    end,
    event = { "BufReadPost", "BufNewFile" },
  },
}
