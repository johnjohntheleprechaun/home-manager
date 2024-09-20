nmap <silent> <F2> <Plug>(coc-rename)

" stolen from https://github.com/hungpham3112/vide/blob/main/plugin/autocomplete_engine/coc-nvim.vim
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#snippet#next()\<CR>" :
  \ "\<Tab>"

inoremap <silent><expr> <S-Tab>
  \ coc#pum#visible() ? coc#pum#prev(1) :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#snippet#prev()\<CR>" :
  \ "\<S-Tab>"
