"Expand tabs into spaces
set expandtab

"Set tab width
function! Tabstop(width)
  execute "set tabstop=" . a:width
  execute "set softtabstop=" . a:width
  execute "set shiftwidth=" . a:width
endfunction
command -nargs=1 Tabstop call Tabstop(<args>)
Tabstop 4
