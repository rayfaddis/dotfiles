-- fuzzy finder for many things (files, file contents, git, etc)
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
      },
    },
    event = "VimEnter",
    init = function()
      local telescope = require("telescope")
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,
    keys = {
      {
        "<C-p>",
        "<cmd>Telescope find_files<CR>",
      },
      {
        "<C-f>",
        "<cmd>Telescope live_grep<CR>",
      },
    },
    lazy = true,
    opts = {
      extensions = {
        fzf = {
          -- fuzzy false will only do exact matching
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          -- (default is "smart_case", other opts: "ignore_case" or "respect_case")
          case_mode = "smart_case",
        }
      },
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "-u",
          "-u",

          "--iglob", "!.git",
          "--iglob", "!node_modules",
          "--iglob", "!public",
          "--iglob", "!tmp",
          "--iglob", "!storage",
        },
      },
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--smart-case",
            "-u",

            "--files",
            "--iglob", "!.git",
            "--iglob", "!node_modules",
            "--iglob", "!public",
            "--iglob", "!tmp",
            "--iglob", "!storage",
            "--hidden",
          },
          path_display = { "truncate" },
        },
      },
    },
  },
}
