return {
  {
    "numToStr/Comment.nvim",
    -- cond = function()
    --   print("ft", vim.bo.filetype)
    --   if vim.bo.filetype ~= "dashboard" then
    --     return
    --   end
    -- end,
    event = "BufEnter",
    lazy = true,
    opts = {},
  }
}
