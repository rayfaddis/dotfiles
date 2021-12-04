nmap <silent> <leader>f <Plug>(coc-definition)
nmap <silent> <leader>d <Plug>(coc-type-definition)

let test#javascript#jest#executable = 'yarn test'

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint'
\ ]

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Tab complete with COC
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set updatetime=300

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>do <Plug>(coc-codeaction)
