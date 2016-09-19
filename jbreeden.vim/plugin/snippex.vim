"Convenience bootstrap function for snippex snippets.
function! SnippexBootstrap(pattern)
  call getchar(0)
  "Remove bootstrap line
  d 
  let prev_z = @z
  let @z = "" 
  execute '.;/' . a:pattern . '/g!/' . a:pattern . '/normal! "Zdd'
   "Remove end line (matched by a:pattern)
   d
  @z
  let @z = prev_z
endfunction

"Convenience bootstrap for snippets with {TODO: ...} style replacements
function! SnippexTodoTemplate()
  d
  let pos = getpos('.')
  execute ".;+" . (b:snippex_content_lines - 2) . "normal! =="
  call setpos('.', pos)
  let @/ = 'TODO'
  call getchar(0)
  execute "normal! /TODO\<CR>va{"
endfunction

"Expand a snippet file from ~/.vim/snippex
function! SnippexExpand(snippet_name)
  let prev_z = @z
  execute "r ~/.vim/snippex/" . a:snippet_name . ".snippex"
  let b:snippex_content_lines = line("']") - line("'[") + 1
  normal! `[0"zy$
  @z
  let @z = prev_z
endfunction

"Load snippets from files in ~/.vim/snippex
function! SnippexLoad()
  for f in split(glob('~/.vim/snippex/*'), '\n')
    let file_name_parts = split(fnamemodify(f, ':t'), '\.')
    let snippet_name = file_name_parts[0]
    if file_name_parts[1] == 'snippex'
      execute 'inoreabbrev =' . snippet_name . '= <Esc>:call SnippexExpand("' . snippet_name . '")<CR>'
    else
      echom "WARNING: Unrecognized snippet file type: " . f
    endif
  endfor
endfunction
call SnippexLoad()

