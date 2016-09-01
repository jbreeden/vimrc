" Adds: Emacs-like ctrl-f ctrl-b for left & right by characters
" Shadows: full-page up/down bindings
nnoremap <C-f> l
inoremap <C-f> <esc>la
nnoremap <C-b> h
inoremap <C-b> <esc>ha

" Adds: Kill to end of line
" Shadows: Some digraph stuff..? (see :help ctrl-k)
nnoremap <C-k> d$
inoremap <C-k> <esc>ld$a

" Adds: Kill to end of line
" Shadows: Some digraph stuff..? (see :help ctrl-k)
nnoremap <C-a> 0
inoremap <C-a> <esc>0i
nnoremap <C-e> $
inoremap <C-e> <esc>l$a
