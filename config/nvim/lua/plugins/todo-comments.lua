-- highlight, list and search TODO like comments (HACK, BUG, NOTE, etc)
return {
  {
    "folke/todo-comments.nvim",
    dependencies = {
      {
        "nvim-lua/plenary.nvim"
      },
    },
    event = "BufEnter",
    lazy = true,
    opts = {},
  },
}
