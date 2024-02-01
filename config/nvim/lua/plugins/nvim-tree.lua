-- file explorer
return {
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
      },
    },
    event = "VimEnter",
    keys = {
      {
        "<leader>f",
        "<cmd>NvimTreeFindFile<cr>",
        desc = "Nvim Tree Find File"
      },
      {
        "<leader>k",
        "<cmd>NvimTreeToggle<cr>",
        desc = "Nvim Tree Toggle"
      },
    },
    lazy = true,
    opts = {
      view = {
        width = 75,
      },
    },
  },
}
