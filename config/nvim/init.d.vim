for type in ['vim', 'nvim']
  for config in split(glob(stdpath('config') . '/init.d/*.' . type), '\n')
    execute 'source ' . config
  endfor
endfor
