return {
  {
    "nvimdev/dashboard-nvim",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
      },
    },
    event = "VimEnter",
    lazy = true,
    opts = {
      config = {
        -- footer = {
        --   '',
        --   '',
        --   'There is always another way'
        -- },
        disable_move = false,
        header = {
          " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
          " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
          " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
          " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
          " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
          " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
          "",
          "",
        },
        project = { enable = false },
        shortcut = {
          {
            action = "Lazy update",
            desc = "Plugin Update",
            icon = "󱐋 ",
            key = "p",
          },
          {
            action = "MasonUpdate",
            desc = "LSP Update",
            group = "Label",
            icon = "󱌢 ",
            key = "l",
          },
          {
            action = "TSUpdate",
            desc = "TS Update",
            icon = " ",
            group = "DiagnosticError",
            key = "t",
          },
          {
            action = "Telescope find_files",
            desc = "Files",
            group = "DiagnosticInfo",
            icon = " ",
            -- icon_hl = '@variable',
            key = "f",
          },
          -- {
          --   action = "Telescope app",
          --   desc = " Apps",
          --   group = "DiagnosticOk",
          --   key = "a",
          -- },
          {
            action = "Telescope dotfiles",
            desc = " dotfiles",
            group = "Number",
            key = "d",
          },
        },
        week_header = {
          enable = false, -- if enabled overrides header setting
        },
        hide = { "statusline", "tabline", "winbar" },
      },
      theme = "hyper",
    },
  },
}
