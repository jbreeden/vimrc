"TODO
function! Eglob(pattern)
  execute "edit " . glob(a:pattern)
endfunction
command! -nargs=1 Eglob call Eglob("<args>")
