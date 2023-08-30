return {
  {
    "akinsho/bufferline.nvim",
    event = "BufEnter",
    keys = {
      {
        "<leader>1",
        "<cmd>BufferLineGoToBuffer 1<cr>",
        desc = "Bufferline Go To Tab 1",
      },
      {
        "<leader>2",
        "<cmd>BufferLineGoToBuffer 2<cr>",
        desc = "Bufferline Go To Tab 2",
      },
      {
        "<leader>3",
        "<cmd>BufferLineGoToBuffer 3<cr>",
        desc = "Bufferline Go To Tab 3",
      },
      {
        "<leader>4",
        "<cmd>BufferLineGoToBuffer 4<cr>",
        desc = "Bufferline Go To Tab 4",
      },
      {
        "<leader>5",
        "<cmd>BufferLineGoToBuffer 5<cr>",
        desc = "Bufferline Go To Tab 5",
      },
      {
        "<leader>6",
        "<cmd>BufferLineGoToBuffer 6<cr>",
        desc = "Bufferline Go To Tab 6",
      },
      {
        "<leader>7",
        "<cmd>BufferLineGoToBuffer 7<cr>",
        desc = "Bufferline Go To Tab 7",
      },
      {
        "<leader>8",
        "<cmd>BufferLineGoToBuffer 8<cr>",
        desc = "Bufferline Go To Tab 8",
      },
      {
        "<leader>9",
        "<cmd>BufferLineGoToBuffer 9<cr>",
        desc = "Bufferline Go To Tab 9",
      },
      {
        "<leader>0",
        "<cmd>BufferLineGoToBuffer 10<cr>",
        desc = "Bufferline Go To Tab 10",
      },
    },
    lazy = true,
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        mode = "tabs",
        numbers = "ordinal",
        offsets = {
          {
            filetype = "NvimTree",
            text = function()
              return vim.fn.getcwd()
            end,
            highlight = "Directory",
            text_align = "left",
          }
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
      }
    },
  },
}
