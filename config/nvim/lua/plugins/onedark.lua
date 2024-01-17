-- onedark theme
return {
  {
    "navarasu/onedark.nvim",
    init = function()
      require("onedark").load()
    end,
    opts = {
      style = "darker",
    },
  },
}

