-- Offers mason's language servers for filetypes not declared in languages.lua.
-- :LangSetup installs the chosen server, enables it for this session, and copies
-- the languages.lua entry to the clipboard.
local M = {}

local ignore_path = vim.fn.stdpath("data") .. "/lang-setup-ignore.json"
local offered = {}

local function ignored()
  if vim.fn.filereadable(ignore_path) == 0 then
    return {}
  end
  local ok, data = pcall(vim.json.decode, table.concat(vim.fn.readfile(ignore_path), "\n"))
  return ok and data or {}
end

local function candidates(filetype)
  return require("mason-lspconfig").get_available_servers({ filetype = filetype })
end

local function offer(buf)
  local filetype = vim.bo[buf].filetype
  if
    filetype == ""
    or vim.bo[buf].buftype ~= ""
    or offered[filetype]
    or require("languages")[filetype]
    or ignored()[filetype]
    or #vim.lsp.get_clients({ bufnr = buf }) > 0
  then
    return
  end

  local servers = candidates(filetype)
  if #servers == 0 then
    return
  end

  offered[filetype] = true
  vim.notify(
    ("No LSP for %s. Candidates: %s. Run :LangSetup"):format(filetype, table.concat(servers, ", "))
  )
end

local function enable(server, filetype)
  vim.lsp.enable(server)
  vim.fn.setreg("+", ('["%s"] = { lsp = { %s = true } },'):format(filetype, server))
  vim.notify(("%s enabled; languages.lua entry copied to clipboard"):format(server))
end

local function install(server, filetype)
  local registry = require("mason-registry")
  local name = require("mason-lspconfig").get_mappings().lspconfig_to_package[server]
  local package = registry.get_package(name)

  if package:is_installed() then
    return enable(server, filetype)
  elseif package:is_installing() then
    return vim.notify(("%s is already installing, run :LangSetup again when done"):format(name))
  end

  vim.notify(("Installing %s..."):format(name))
  package:install({}, vim.schedule_wrap(function(success, result)
    if success then
      enable(server, filetype)
    else
      vim.notify(("Installing %s failed: %s"):format(name, result), vim.log.levels.ERROR)
    end
  end))
end

function M.pick()
  local filetype = vim.bo.filetype
  local never = "Never for " .. filetype

  vim.ui.select(
    vim.list_extend(candidates(filetype), { never }),
    { prompt = "Language server for " .. filetype },
    function(choice)
      if choice == never then
        local data = ignored()
        data[filetype] = true
        vim.fn.writefile({ vim.json.encode(data) }, ignore_path)
      elseif choice then
        install(choice, filetype)
      end
    end
  )
end

function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("UserLangSetup", {}),
    callback = function(event)
      -- give declared servers time to attach first
      vim.defer_fn(function()
        if vim.api.nvim_buf_is_valid(event.buf) then
          offer(event.buf)
        end
      end, 1000)
    end,
  })
  vim.api.nvim_create_user_command("LangSetup", M.pick, {})
end

return M
