function! SnippexExpand(snippet_name)
  execute "r ~/.vim/snippex/" . a:snippet_name . ".snippex"
  execute "normal! `[0\"zy$dd:@z\<CR>"
endfunction

"Load snippets from files in ~/.vim/snippex
function! SnippexLoad()
  for f in split(glob('~/.vim/snippex/*'), '\n')
    let file_name_parts = split(fnamemodify(f, ':t'), '\.')
    let snippet_name = file_name_parts[0]
    if file_name_parts[1] == 'snippex'
      execute 'inoreabbrev =' . snippet_name . '= :silent call SnippexExand(' . snippet_name ')'
    else
      echom "WARNING: Unrecognized snippet file type: " . f
    endif
  endfor
endfunction
call SnippexLoad()

"A snippet for making snippets
inoreabbrev =snippet= call Snippex('{TODO: lhs}', '{TODO: rhs}')

