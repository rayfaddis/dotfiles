local gps = require('nvim-gps')
local filename = {
  'filename',
  file_status = true,      -- Displays file status (readonly status, modified status)
  path = 0,                -- 0: Just the filename
  shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
  symbols = {
    modified = ' +',      -- Text to show when the file is modified.
    readonly = ' -',      -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
  }
}

require('lualine').setup({
  options = {
    disabled_filetypes = { 'packer', 'NvimTree' },
    globalstatus = false,
  },
  sections = {
    lualine_a = { filename },
    lualine_b = { 'diff', 'diagnostics' },
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
      'lsp_progress'
    },
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = { filename },
    lualine_b = { 'diff', 'diagnostics' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
})
