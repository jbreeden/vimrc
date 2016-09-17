function! Snippet(lhs, rhs)
    if match(a:rhs, 'TODO')
        execute 'inoreabbrev ' . a:lhs . ' ' . a:rhs . '<Esc>`[/TODO<CR>'
    else
        execute 'inoreabbrev ' . a:lhs . ' ' . a:rhs
    endif
endfunction

"Load snippets from files in ~/.vim/snippets
function! QuickSnippetsLoad()
    for f in split(glob('~/.vim/snippets/*'), '\n')
        let file_name_parts = split(fnamemodify(f, ':t'), '\.')
        let snippet_name = file_name_parts[0]
        if file_name_parts[1] == 'vim'
           execute "source " . f
       else
           call Snippet('=' . snippet_name . '=', '<Esc>:r ' . f . '<CR>')
       endif
    endfor
endfunction
call QuickSnippetsLoad()

"A snippet for making snippets
call Snippet('=quicksnip=', 'call Snippet(''{TODO: lhs}'', ''{TODO: rhs}'')')

