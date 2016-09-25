command! -nargs=1 -range Eval
\ | <line1>,<line2> y
\ | ']
\ | put
\ | '[,'] ! <args>

vnoremap <Leader>eR :<Home>silent <End> Eval ruby<CR>
vnoremap <Leader>eP :<Home>silent <End> Eval python<CR>
vnoremap <Leader>eB :<Home>silent <End> Eval bash<CR>
vnoremap <Leader>eJ :<Home>silent <End> Eval node<CR>
vnoremap <Leader>eX :<Home>silent <End> Eval ex<CR>

