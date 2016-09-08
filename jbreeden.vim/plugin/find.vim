function! FindMappings()
  noremap e y$:q<CR><Esc>:e <C-r>"
  noremap t y$<Esc>:e <C-r>"
endfunction

noremap <Leader>find :vert tabnew<CR>
  \:set buftype=nofile<CR>
  \i(e) Edit file (t) Open in new tab<Esc><Home>
  \:call FindMappings()<CR>
  \:r! find . -iname ""<Left>
