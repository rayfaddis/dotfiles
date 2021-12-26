function nvim_create_augroup(group_name, definition)
  vim.api.nvim_command('augroup ' .. group_name)
  vim.api.nvim_command('autocmd!')
  for _, def in ipairs(definition) do
    local command = table.concat(vim.tbl_flatten({ 'autocmd', def }), ' ')
    vim.api.nvim_command(command)
  end
  vim.api.nvim_command('augroup END')
end

require('disable-builtins')
require('settings')
require('plugins')
require('keymaps') -- move this to be loaded a different way

local function source_files_from_dir(directory)
  for _, file in pairs(vim.fn.readdir(directory)) do
    local file = directory .. '/' .. file
    if vim.fn.filereadable(file) then
      vim.fn.execute('source ' .. file)
    end
  end
end

-- load all additional configs
local lua_config_dir = vim.fn.stdpath('config') .. '/lua'
local config_dirs = { 'plugins', 'lsp', 'themes' }
for _, dir in pairs(config_dirs) do
  source_files_from_dir(lua_config_dir .. '/' .. dir)
end
