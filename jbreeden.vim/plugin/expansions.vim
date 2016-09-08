"Insert the result of an expression
noremap! <Leader>ee <C-r>=

"Insert the result of an expansion
noremap! <Leader>eE <C-r>=expand("")<Left><Left>

"Insert variations of the current file name/path
noremap! <Leader>eff <C-r>=expand('%')<CR>
noremap! <Leader>efp <C-r>=expand('%:p')<CR>
noremap! <Leader>efd <C-r>=expand('%:h')<CR>
noremap! <Leader>efn <C-r>=expand('%:t')<CR>
noremap! <Leader>efr <C-r>=expand('%:r')<CR>
noremap! <Leader>efe <C-r>=expand('%:e')<CR>

"Insert variations of the current file under the cursor
noremap! <Leader>ecf <C-r>=expand('<cfile>')<CR>
noremap! <Leader>ecp <C-r>=expand('<cfile>:p')<CR>
noremap! <Leader>ecd <C-r>=expand('<cfile>:h')<CR>
noremap! <Leader>ecn <C-r>=expand('<cfile>:t')<CR>
noremap! <Leader>ecr <C-r>=expand('<cfile>:r')<CR>
noremap! <Leader>ece <C-r>=expand('<cfile>:e')<CR>

"Insert objects currently under the cursor
noremap! <Leader>ecw <C-r>=expand('<cword>')<CR>
noremap! <Leader>ecW <C-r>=expand('<cWORD>')<CR>

