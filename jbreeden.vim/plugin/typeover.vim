"Automatically inserts closing brackets/etc *after* the cursor.
"If the closing bracket is type while it is under the cursor,
"it is simply traversed over (as if the user pressed <Right>)

let g:typeover_enabled = 1

function! Typeover(char)
    if g:typeover_enabled && getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

inoremap <expr> ) Typeover(')')
inoremap <expr> ] Typeover(']')
inoremap <expr> } Typeover('}')
inoremap <expr> > Typeover('>')
inoremap <expr> " Typeover('"')
inoremap <expr> ' Typeover("'")
inoremap <expr> ` Typeover('`')

