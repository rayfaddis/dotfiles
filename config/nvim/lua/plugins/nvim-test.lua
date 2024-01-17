-- execute various tests for the current file or test file
return {
  "klen/nvim-test",
  event = "BufEnter",
  lazy = true,
  keys = {
    {
      "<leader>t",
      "<cmd>TestFile<CR>",
      desc = "Test current file",
    },
    {
      "<leader>s",
      "<cmd>TestNearest<CR>",
      desc = "Test nearests test",
    },
    {
      "<leader>l",
      "<cmd>TestLast<CR>",
      desc = "Test last test",
    },
    {
      "<leader>l",
      "<cmd>TestSuite<CR>",
      desc = "Test entire test suite",
    },
    {
      "<leader>gt",
      "<cmd>TestVisit<CR>",
      desc = "Visit test file",
    },
  },
  opts = {}
}
