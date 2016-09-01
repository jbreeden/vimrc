" Adds: Emacs-like ctrl-f ctrl-b for left & right by characters
nnoremap <C-f> <Right>
vnoremap <C-f> <Right>
cnoremap <C-f> <Right>
inoremap <C-f> <Right>

nnoremap <C-b> <Left>
vnoremap <C-b> <Left>
cnoremap <C-b> <Left>
inoremap <C-b> <Left>

" Adds: Adds ctrl-a ctrl-e for begin/end of line:w
nnoremap <C-a> <Home>
cnoremap <C-a> <Home>
vnoremap <C-a> <Home>
inoremap <C-a> <esc>0i

nnoremap <C-e> <End>
cnoremap <C-e> <End>
vnoremap <C-e> <End>
inoremap <C-e> <esc>l$a

" Adds: Kill to end of line
nnoremap <C-k> d$
inoremap <C-k> <esc>d$a

