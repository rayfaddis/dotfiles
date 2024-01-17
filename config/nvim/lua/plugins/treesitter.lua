-- syntax highlighting
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- update parsers on install/updates
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        auto_install = true,
        endwise = { enable = true },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
    dependencies = {
      {
        "RRethy/nvim-treesitter-endwise"
      },
    },
    event = "BufEnter",
    lazy = true,
    opts = {},
  },
}
