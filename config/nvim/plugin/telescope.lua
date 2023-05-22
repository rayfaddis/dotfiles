require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                        -- the default case_mode is "smart_case"
    }
  },
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-u',
      '-u',

      '--iglob', '!.git',
      '--iglob', '!node_modules',
      '--iglob', '!public',
      '--iglob', '!tmp',
      '--iglob', '!storage',
    },
  },
  pickers = {
    find_files = {
      find_command = {
        'rg',
        '-u',

        '--files',
        '--iglob', '!.git',
        '--iglob', '!node_modules',
        '--iglob', '!public',
        '--iglob', '!tmp',
        '--iglob', '!storage',
        '--hidden',
      },
      path_display = { "truncate" },
    }
  }
}

require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap(
  'n', '<C-p>', '<cmd>Telescope find_files<CR>', { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<C-f>', '<cmd>Telescope live_grep<CR>', { noremap = true }
)
