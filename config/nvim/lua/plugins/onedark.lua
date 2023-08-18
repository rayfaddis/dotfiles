return {
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").load()
    end,
    lazy = false,
    opts = {
      style = "darker",
    },
  },
}

