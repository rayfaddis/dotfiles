local U = {}

-- function KB(mode, keyStroke, action, opts)
--   vim.api.nvim_set_keymap(mode, keyStroke, action, opts or { noremap = true })
-- end

function TableContains(tbl, x)
  local found = false
  for _, v in pairs(tbl) do
    if v == x then
      found = true
    end
  end
  return found
end

-- function TableClone(source)
--   local clone = {}
--   for k, v in pairs(source) do
--     clone[k] = v
--   end
--   return clone
-- end

function TableSpread(source, tbl)
  local merged = TableClone(source)
  for k, v in pairs(tbl) do
    merged[k] = v
  end
  return merged
end

function U.ensure_packer()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

function U.nvim_create_augroup(group_name, definition)
  vim.api.nvim_command('augroup ' .. group_name)
  vim.api.nvim_command('autocmd!')
  for _, def in ipairs(definition) do
    local command = table.concat(vim.tbl_flatten({ 'autocmd', def }), ' ')
    vim.api.nvim_command(command)
  end
  vim.api.nvim_command('augroup END')
end

return U;
