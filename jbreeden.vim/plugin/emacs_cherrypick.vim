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
inoremap <expr> <Tab> InsertModeTab()

"Adds: emacs-like ctrl-f ctrl-b for left & right by characters
nnoremap <c-f> <right>
vnoremap <c-f> <right>
cnoremap <C-f> <Right>
inoremap <C-f> <Right>

nnoremap <C-b> <Left>
vnoremap <C-b> <Left>
cnoremap <C-b> <Left>
inoremap <C-b> <Left>

"Adds: Adds ctrl-a ctrl-e for begin/end of line:w
nnoremap <C-a> <Home>
cnoremap <C-a> <Home>
vnoremap <C-a> <Home>
inoremap <C-a> <esc>I

nnoremap <C-e> <End>
cnoremap <C-e> <End>
vnoremap <C-e> <End>
inoremap <C-e> <esc>A

"Adds: Kill to end of line
nnoremap <C-k> d$

"Kill behavior in insert mode:
" - If appending beyond last char, delete the newline
" - else, there is text after the cursor and we'll delete that
function! InsertModeKill()
  if col('.') == col('$')
    return "\<Delete>"
  elseif col('.') == 1
    return "\<Esc>d$i"
  else
    return "\<Esc>ld$a"
  endif
endfunction
inoremap <expr> <C-k> InsertModeKill()

"Adds: ctrl-d deletion for command mode & insert mode
" (For noral mode, this is used to page down by half page.
"  So far I think I'll keep that behavior as is)
cnoremap <C-d> <Delete>
inoremap <C-d> <Delete>

