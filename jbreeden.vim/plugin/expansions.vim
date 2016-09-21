"Insert variations of the current file name/path
nnoremap <Leader>iff i<C-r>=expand('%')<CR><Esc>
nnoremap <Leader>ifp i<C-r>=expand('%:p')<CR><Esc>
nnoremap <Leader>ifd i<C-r>=expand('%:h')<CR><Esc>
nnoremap <Leader>ifn i<C-r>=expand('%:t')<CR><Esc>
nnoremap <Leader>ifr i<C-r>=expand('%:r')<CR><Esc>
nnoremap <Leader>ife i<C-r>=expand('%:e')<CR><Esc>

nnoremap <Leader>aff a<C-r>=expand('%')<CR><Esc>
nnoremap <Leader>afp a<C-r>=expand('%:p')<CR><Esc>
nnoremap <Leader>afd a<C-r>=expand('%:h')<CR><Esc>
nnoremap <Leader>afn a<C-r>=expand('%:t')<CR><Esc>
nnoremap <Leader>afr a<C-r>=expand('%:r')<CR><Esc>
nnoremap <Leader>afe a<C-r>=expand('%:e')<CR><Esc>

cnoremap <Leader>ff <C-r>=expand('%')<CR>
cnoremap <Leader>fp <C-r>=expand('%:p')<CR>
cnoremap <Leader>fd <C-r>=expand('%:h')<CR>
cnoremap <Leader>fn <C-r>=expand('%:t')<CR>
cnoremap <Leader>fr <C-r>=expand('%:r')<CR>
cnoremap <Leader>fe <C-r>=expand('%:e')<CR>
