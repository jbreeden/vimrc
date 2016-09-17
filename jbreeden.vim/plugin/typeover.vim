"Automatically inserts closing brackets/etc *after* the cursor.
"If the closing bracket is type while it is under the cursor,
"it is simply traversed over (as if the user pressed <Right>)

let g:typeover_enabled = 1

function! TypeoverOpen(start, end)
    if !g:typeover_enabled
        return a:start
    else
        return a:start . a:end . "\<Left>"
    endif
endfunction

function! TypeoverClose(char)
    if g:typeover_enabled && getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

inoremap <expr> ( TypeoverOpen('(', ')')
inoremap <expr> ) TypeoverClose(')')

inoremap <expr> [ TypeoverOpen('[', ']')
inoremap <expr> ] TypeoverClose(']')

inoremap <expr> { TypeoverOpen('{', '}')
inoremap <expr> } TypeoverClose('}')

inoremap <expr> < TypeoverOpen('<', '>')
inoremap <expr> > TypeoverClose('>')

function! TypeoverTwins(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char . a:char . "\<Left>"
    endif
endfunction

inoremap <expr> " TypeoverTwins('"')
inoremap <expr> ' TypeoverTwins("'")
inoremap <expr> ` TypeoverTwins('`')

