for config in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
  exe 'source' config
endfor
