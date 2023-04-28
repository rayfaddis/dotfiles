-- local navic = require('nvim-navic')

local filename = {
  'filename',
  file_status = true, -- displays file status (readonly status, modified status)
  path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
  shorting_target = 40, -- shortens path to leave 40 spaces in the window
  symbols = {
    modified = ' +', -- text to show when the file is modified
    readonly = ' -', -- text to show when the file is non-modifiable or readonly
    unnamed = '[No Name]', -- text to show for unnamed buffers
  }
}

require('lualine').setup({
  options = {
    disabled_filetypes = {
      'dashboard',
      'help',
      'NvimTree',
      'packer',
      'Trouble',
    },
    theme = 'onedark',
    globalstatus = false,
  },
  sections = {
    lualine_a = {},
    lualine_b = { 'diff' },
    lualine_c = { 'diagnostics' },
    lualine_x = { 'lsp_progress' },
    lualine_y = { 'location', 'progress' },
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = { 'diff' },
    lualine_c = { 'diagnostics' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    -- lualine_a = {'buffers'},
    -- lualine_b = {},
    -- lualine_c = {},
    -- lualine_x = {},
    -- lualine_y = {},
    -- lualine_z = {'tabs'}
  },
  extensions = {},
  winbar = {
    lualine_a = { filename },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { 'ObsessionStatus()' },
    -- lualine_x = { navic.get_location, { cond = navic.is_available } },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = { filename },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  }
})
