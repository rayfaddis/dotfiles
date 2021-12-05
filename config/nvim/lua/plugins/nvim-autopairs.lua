require('nvim-autopairs').setup {
  --- map_cr = true --- for when not using completion plugin
  check_ts = true
}

-- with cmp auto completion
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({  map_char = { tex = '' } })
)
