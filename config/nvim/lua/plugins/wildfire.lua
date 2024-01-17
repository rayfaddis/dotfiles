-- incremental text selection within blocks using CR
return {
  {
    "sustech-data/wildfire.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    opts = {},
  },
}
