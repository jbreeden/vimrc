nnoremap <Leader>! :execute "normal! " . eval('"' . escape(getline('.'), '"') . '"') <CR>
