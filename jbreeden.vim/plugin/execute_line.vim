nnoremap <Leader>! :execute "normal! " . eval('"' . escape(getline('.'), '"') . '"') <CR>
nnoremap <Leader>e! :execute getline('.')
