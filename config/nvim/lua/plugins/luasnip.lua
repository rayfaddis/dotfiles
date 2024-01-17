-- code snippets
return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "./snippets" }
      })
    end,
    dependencies = {
      {
        "rafamadriz/friendly-snippets"
      },
    },
    event = "BufEnter",
    lazy = "true",
    opts = {},
    version = "2.*",
  }
}
