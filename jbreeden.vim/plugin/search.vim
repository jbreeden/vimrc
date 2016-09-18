function! Search()
  vert tabnew
  call SnippexExpand('search')
endfunction
command! Search silent call Search()
nnoremap <Leader>S :Search<CR>

