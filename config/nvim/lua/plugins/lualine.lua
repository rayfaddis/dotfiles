return {
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    lazy = true,
    opts = function()
      function FileNameFormatter(filename)
        if string.match(filename, "NvimTree") then
          filename = "File Explorer"
        end

        return filename;
      end

      local branch = {
        {
          "branch",
          icon = {
            "",
          },
        },
      }

      local diagnostics = {
        "diagnostics",
        -- cond = function()
        --   if vim.bo.filetype == "NvimTree" then
        --     print("test")
        --     return false
        --   end
        -- end,
      }

      local diff = {
        "diff",
        symbols = {
          added = " ",
          modified = " ",
          removed = " ",
        },
      }

      local filename_symbols = {
        modified = "",
        readonly = "",
        unnamed = "",
        newfile = "",
      }

      local filename = {
        "filename",
        fmt = FileNameFormatter,
        symbols = filename_symbols,
      }

      local filetype = {
        "filetype",
        colored = false,
        icon_only = true,
      }

      local shared_winbar = {
        lualine_a = {
          filetype,
          filename,
        },
        lualine_b = {
          -- { "filetype" },
          diff,
        },
        lualine_y = {
          diagnostics,
        }
      }

      return {
          options = {
          -- component_separators = { left = "", right = "" },
          disabled_filetypes = { winbar = { "packer" } },
          -- section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = branch,
          lualine_c = {
            {
              -- TableSpread(filetype, { filetype_names = { NvimTree = "File Explorer" } }),
              "filename",
              fmt = function(string)
                if string.match(string, "NvimTree") then
                  string = ""
                end

                return string;
              end,
              path = 1,
              symbols = filename_symbols,
            },
          },
          lualine_x = { "lsp_progress" },
          lualine_y = { "searchcount" },
          lualine_z = { "location" },
        },
        winbar = shared_winbar,
        inactive_winbar = shared_winbar,
      }
    end
  },
}
