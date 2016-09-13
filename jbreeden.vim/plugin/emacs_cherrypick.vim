"Adds: ctrl-p & ctrl-n in insert mode (and a remapping for completion)
inoremap <C-p> <esc>ka
inoremap <C-n> <esc>ja

"Tab behavior in insert mode
" - If char to left of cursor is whitespace, tab
" - else start autocomplete (can be avoided by using ctrl-v)
function! InsertModeTab()
  if match(getline('.')[col('.') - 2], '\S') == -1
    return "\<Tab>"
  else
    return "\<C-n>"
  endif
endfunction
function! InsertModeShiftTab()
  if match(getline('.')[col('.') - 2], '\S') == -1
    return "\<S-Tab>"
  else
    return "\<C-p>"
  endif
endfunction
inoremap <expr> <Tab> InsertModeTab()
inoremap <expr> <S-Tab> InsertModeShiftTab()

"Adds: emacs-like ctrl-f ctrl-b for left & right by characters
nnoremap <c-f> <right>
vnoremap <c-f> <right>
cnoremap <C-f> <Right>
inoremap <C-f> <Right>

nnoremap <C-b> <Left>
vnoremap <C-b> <Left>
cnoremap <C-b> <Left>
inoremap <C-b> <Left>

"Adds: Adds ctrl-a ctrl-e for begin/end of line
nnoremap <C-a> <Home>
cnoremap <C-a> <Home>
vnoremap <C-a> <Home>
"function! InsertModeCtrlA()
"  let start = col('.')
"  execute "normal! \<Esc>I"
"  if start == col('.')
"    execute "normal! \<Home>"
"  endif
"endfunction
"inoremap <C-a> <esc>:call InsertModeCtrlA()<cr>i
inoremap <C-a> <Esc>I

nnoremap <C-e> <End>
cnoremap <C-e> <End>
vnoremap <C-e> <End>
inoremap <C-e> <esc>A

"Adds: ctrl-d deletion for command mode & insert mode
" (For noral mode, this is used to page down by half page.
"  So far I think I'll keep that behavior as is)
cnoremap <C-d> <Delete>
inoremap <C-d> <Delete>

