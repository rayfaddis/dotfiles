set termguicolors
syntax enable
set background=dark

" colorscheme f-one-dark

" colorscheme one
" call one#highlight('Normal', '', '0d1117', 'none')

if (has("autocmd"))
  augroup colorextend
    autocmd!
    " let s:background = { "gui": "#1c1c1c", "cterm": "235", "cterm16": "0", }
    " let s:background = { "gui": "#141414", "cterm": "235", "cterm16": "0", }
    let s:background = { "gui": "#0a0a0a", "cterm": "235", "cterm16": "0", }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background })
  augroup END
end
colorscheme onedark

" let base16colorspace=256
" colorscheme base16-dracula

set laststatus=2  " always display the status line
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands

" display line numbers
set number
set numberwidth=5

" whitespace characters
set list
set listchars=tab:▸\ ,nbsp:␣,lead:·,trail:·,extends:→,precedes:← " ,eol:¬
set showbreak=i↪\

" make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
