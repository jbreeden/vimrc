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

