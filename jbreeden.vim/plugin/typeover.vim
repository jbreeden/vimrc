function! Typeover(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

inoremap ( ()<Left>
inoremap <expr> ) Typeover(')')

inoremap [ []<Left>
inoremap <expr> ] Typeover(']')

inoremap { {}<Left>
inoremap <expr> } Typeover('}')

inoremap < <><Left>
inoremap <expr> > Typeover('>')

function! TypeoverPair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char . a:char . "\<Left>"
    endif
endfunction
inoremap <expr> " TypeoverPair('"')
inoremap <expr> ' TypeoverPair("'")
inoremap <expr> ` TypeoverPair('`')

