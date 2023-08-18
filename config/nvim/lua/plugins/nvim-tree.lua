return {
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
    opts = {
      view = {
        width = 75,
      },
    },
  },
}
