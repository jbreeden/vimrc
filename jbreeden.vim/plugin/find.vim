function! Find()
  vert tabnew
  set buftype=nofile
  call feedkeys(":0r! find . -iname ")
endfunction
command! Find call Find()
nnoremap <Leader>F :Find<CR>

