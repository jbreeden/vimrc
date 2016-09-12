"TODO
"Should ignore space before closing token if it's on it's own line (so that
"indentation doesn't have to be re-done by the user in the likely case that
"it's still line separated).
"
"Ruby statement modifiers are f-ing my day up

command! ReselectToHere normal! mZgv`Z

"""
" Utility Functions
"""

"Performs fn, passing in args, and attempts
"to undo any window changes (cursor position, selection, etc)
"if the function returns a false value (0)
function! Try(in_visual_mode, fn, args)
  let pos = getpos('.')
  let view = winsaveview()
  let v_start = getpos("'<")
  let v_end = getpos("'>")

  if !call(a:fn, a:args)
    call winrestview(view)
    call setpos('.', pos)
    if a:in_visual_mode
      call setpos('.', v_start)
      execute "normal! " . visualmode()
      call setpos('.', v_end)
    endif
  endif
endfunction

"Goto previous char (even if it's on the previous line)
function! PrevChar()
  if col('.') == 1 && line('.') > 1
    normal! k$
  else
    normal! h
  endif
endfunction

"Goto next char (even if it's on the next line)
function! NextChar()
  if getline(line('.'))[col('.')] =~ '^$' && line('.') < line('$')
    normal! j0
  else
    normal! l
  endif
endfunction

"""
" Text Objects
"""

"Move by blank lines
noremap <silent> <Leader>} :call search('\v^\s*$', "W")<CR>
noremap <silent> <Leader>{ :call search('\v^\s*$', "Wb")<CR>
vnoremap <silent> <Leader>} :call search('\v^\s*$', "W")<CR>:ReselectToHere<CR>
vnoremap <silent> <Leader>{ :call search('\v^\s*$', "Wb")<CR>:ReselectToHere<CR>

"Select the object you're inside
function! SelectInside(start, middle, end, visual, scope, ...)
  "Setup invariant: always in normal mode when executing
  "(Needs to be reset when recursing, so may as well always check it when
  " entering the function)
  if mode() =~ 'v'
    execute "normal! \<Esc>"
  endif

  let recursing = len(a:000) > 0
  let old_selection = [getpos("'<"),getpos("'>")]

  "Find the start token
  if a:visual && !recursing
    call setpos('.', getpos("'<"))
  endif

  if !searchpair(a:start, a:middle, a:end, 'bW')
    return 0
  endif
  
  let start_token_pos = getpos('.')

  "Special case: tokens are on same or adjacent lines, with only whitespace in
  "between. Collapse the tokens onto a single line and select between.
"  let to_next_line = join([getline('.')[col('.')-1:], getline(line('.') + 1)], "\n")
"  if to_next_line =~ (a:start . '\s*\n\s*' . a:end)
"    echom "In the new hotness"
"    normal! v$dd$
"    call append('.', split(substitute(to_next_line, '\m\(' . a:start . '\)\s*\n\s*\(' . a:end . '\)', '\1 \2', ''), "\n"))
"    normal! J
"    call search(a:start, 'eWc')
"    normal lv
"    return 1
"  endif

  if a:scope == 'i'
    call search(a:start, 'ec')
    call NextChar()
  endif

  "Set the mark, then move beyond the start token
  "so it doesn't match it's own end token when we
  "call searchpair below. (In inner mode, we already
  "did NextChar above.)
  let selection_lhs = getpos('.')
  if a:scope != 'i'
    call NextChar()
  endif

  "Find the end token
  if !searchpair(a:start, a:middle, a:end, 'cW')
    return 0
  endif

  let end_token_pos = getpos('.')
  if a:scope == 'i'
    call PrevChar()
  else
    call search(a:end, 'ec')
  endif

  let selection_rhs = getpos('.')
  echo string(selection_lhs) string(selection_rhs)
  normal! v
  call setpos('.', selection_lhs)

  let new_selection = [selection_lhs, selection_rhs]
  if a:visual && old_selection == new_selection
    call setpos('.', selection_lhs)
    if searchpair(a:start, a:middle, a:end, 'bW')
      return SelectInside(a:start, a:middle, a:end, a:visual, a:scope, 1)
    else
      return 0
    endif
  endif
  
  return 1
endfunction

command! IParen :call Try(0, "SelectInside", ['(', '', ')', 0, 'i'])
command! AParen :call Try(0, "SelectInside", ['(', '', ')', 0, 'a'])
noremap <silent> <Leader>i( :call Try(0, "SelectInside", ['(', '', ')', 0, 'i'])<CR>
vnoremap <silent> <Leader>i( :call<C-U>call Try(1, "SelectInside", ['(', '', ')', 1, 'i'])<CR>
noremap <silent> <Leader>a( :call Try(0, "SelectInside", ['(', '', ')', 0, 'a'])<CR>
vnoremap <silent> <Leader>a( :call<C-U>call Try(1, "SelectInside", ['(', '', ')', 1, 'a'])<CR>

command! ISquare :call SelectInside('\[', '', '\]', 0, 'i')
command! ASquare  :call SelectInside('\[', '', '\]', 0, 'a')
noremap <silent> <Leader>i[ :call Try(0, "SelectInside", ['\[', '', '\]', 0, 'i'])<CR>
vnoremap <silent> <Leader>i[ :call<C-U>call Try(1, "SelectInside", ['\[', '', '\]', 1, 'i'])<CR>
noremap <silent> <Leader>a[ :call Try(0, "SelectInside", ['\[', '', '\]', 0, 'a'])<CR>
vnoremap <silent> <Leader>a[ :call<C-U>call Try(1, "SelectInside", ['\[', '', '\]', 1, 'a'])<CR>

command! ICurly :call SelectInside('{', '', '}', 0, 'i')
command! ACurly :call SelectInside('{', '', '}', 0, 'a')
noremap <silent> <Leader>i{ :call Try(0, "SelectInside", ['{', '', '}', 0, 'i'])<CR>
vnoremap <silent> <Leader>i{ :call<C-U>call Try(1, "SelectInside", ['{', '', '}', 1, 'i'])<CR>
noremap <silent> <Leader>a{ :call Try(0, "SelectInside", ['{', '', '}', 0, 'a'])<CR>
vnoremap <silent> <Leader>a{ :call<C-U>call Try(1, "SelectInside", ['{', '', '}', 1, 'a'])<CR>

command! IAngle :call SelectInside('<', '', '>', 0, 'i')
command! AAngle :call SelectInside('<', '', '>', 0, 'a')
noremap <silent> <Leader>i< :call Try(0, "SelectInside", ['<', '', '>', 0, 'i'])<CR>
vnoremap <silent> <Leader>i< :call<C-U>call Try(1, "SelectInside", ['<', '', '>', 1, 'i'])<CR>
noremap <silent> <Leader>a< :call Try(0, "SelectInside", ['<', '', '>', 0, 'a'])<CR>
vnoremap <silent> <Leader>a< :call<C-U>call Try(1, "SelectInside", ['<', '', '>', 1, 'a'])<CR>

let g:ruby_block_start = '\%(\<do\>\|\<def\>\|\<if\>\|\<unless\>\|\<while\>\|\<begin\>\|\<class\>\|\<module\>\)'
let g:ruby_block_end = '\%(\<end\>\)'
command! IDo :call SelectInside(g:ruby_block_start, '', g:ruby_block_end, 0, 'i')
command! ADo :call SelectInside(g:ruby_block_start, '', g:ruby_block_end, 0, 'a')
noremap <silent> <Leader>ido :call Try(0, "SelectInside", [g:ruby_block_start, '', g:ruby_block_end, 0, 'i'])<CR>
vnoremap <silent> <Leader>ido :call<C-U>call Try(1, "SelectInside", [g:ruby_block_start, '', g:ruby_block_end, 1, 'i'])<CR>
noremap <silent> <Leader>ado :call Try(0, "SelectInside", [g:ruby_block_start, '', g:ruby_block_end, 0, 'a'])<CR>
vnoremap <silent> <Leader>ado :call<C-U>call Try(1, "SelectInside", [g:ruby_block_start, '', g:ruby_block_end, 1, 'a'])<CR>

function! SelectInsideBars(in_visual_mode)
  if a:in_visual_mode 
    call setpos(".", getpos("'>"))
  endif
  if !search('|', 'W')
    return 0
  endif
  normal! v
  if a:in_visual_mode 
    call setpos(".", getpos("'<"))
  endif
  if !search('|', 'bW')
    return 0
  endif
  normal! o
  return 1
endfunction

noremap <silent> <Leader>i<bar> :call Try(0, "SelectInsideBars", [0])<CR>
vnoremap <silent> <Leader>i<bar> <Esc>:<C-U>call Try(1, "SelectInsideBars", [1])<CR>

"Select the next object
function! SelectNext(start, middle, end, scope, backward)
  if mode() =~? 'v'
    execute "normal! \<Esc>"
  endif

  let search_opt = 'W'
  let next_token = a:start
  if a:backward
    let search_opt .= 'b'
    let next_token = a:end
  else
    let search_opt .= 'e'
  endif
  if !search(next_token, search_opt)
    return 1
  endif

  if !a:backward
    call NextChar()
  endif

  let pos = getpos('.')
  if !SelectInside(a:start, a:middle, a:end, 0, a:scope)
    call setpos('.', pos)
    let next_search_opt = search_opt

    "Going forward: we've nudge past the start token alredy,
    "               so accept matches at the current char.
    "Going a:backward: we're at the start of the end token,
    "                don't accept match at current token.
    if a:backward
      let next_search_opt .= 'n'
    else
      let next_search_opt .= 'cn'
    end

    if search(next_token, next_search_opt)
      return SelectNext(a:start, a:middle, a:end, a:scope, a:backward)
    else
      return 1
    endif
  endif
  return 1
endfunction

noremap <silent> <Leader>in( :call Try(0, "SelectNext", ['(', '', ')', 'i', 0])<CR>
vnoremap <silent> <Leader>in( :call<C-U>call Try(1, "SelectNext", ['(', '', ')', 'i', 0])<CR>
noremap <silent> <Leader>an( :call Try(0, "SelectNext", ['(', '', ')', 'a', 0])<CR>
vnoremap <silent> <Leader>an( :call<C-U>call Try(1, "SelectNext", ['(', '', ')', 'a', 0])<CR>
noremap <silent> <Leader>ip( :call Try(0, "SelectNext", ['(', '', ')', 'i', 1])<CR>
vnoremap <silent> <Leader>ip( :call<C-U>call Try(1, "SelectNext", ['(', '', ')', 'i', 1])<CR>
noremap <silent> <Leader>ap( :call Try(0, "SelectNext", ['(', '', ')', 'a', 1])<CR>
vnoremap <silent> <Leader>ap( :call<C-U>call Try(1, "SelectNext", ['(', '', ')', 'a', 1])<CR>

noremap <silent> <Leader>in[ :call Try(0, "SelectNext", ['\[', '', '\]', 'i', 0])<CR>
vnoremap <silent> <Leader>in[ :call<C-U>call Try(1, "SelectNext", ['\[', '', '\]', 'i', 0])<CR>
noremap <silent> <Leader>an[ :call Try(0, "SelectNext", ['\[', '', '\]', 'a', 0])<CR>
vnoremap <silent> <Leader>an[ :call<C-U>call Try(1, "SelectNext", ['\[', '', '\]', 'a', 0])<CR>
noremap <silent> <Leader>ip[ :call Try(0, "SelectNext", ['\[', '', '\]', 'i', 1])<CR>
vnoremap <silent> <Leader>ip[ :call<C-U>call Try(1, "SelectNext", ['\[', '', '\]', 'i', 1])<CR>
noremap <silent> <Leader>ap[ :call Try(0, "SelectNext", ['\[', '', '\]', 'a', 1])<CR>
vnoremap <silent> <Leader>ap[ :call<C-U>call Try(1, "SelectNext", ['\[', '', '\]', 'a', 1])<CR>

noremap <silent> <Leader>in{ :call Try(0, "SelectNext", ['{', '', '}', 'i', 0])<CR>
vnoremap <silent> <Leader>in{ :call<C-U>call Try(1, "SelectNext", ['{', '', '}', 'i', 0])<CR>
noremap <silent> <Leader>an{ :call Try(0, "SelectNext", ['{', '', '}', 'a', 0])<CR>
vnoremap <silent> <Leader>an{ :call<C-U>call Try(1, "SelectNext", ['{', '', '}', 'a', 0])<CR>
noremap <silent> <Leader>ip{ :call Try(0, "SelectNext", ['{', '', '}', 'i', 1])<CR>
vnoremap <silent> <Leader>ip{ :call<C-U>call Try(1, "SelectNext", ['{', '', '}', 'i', 1])<CR>
noremap <silent> <Leader>ap{ :call Try(0, "SelectNext", ['{', '', '}', 'a', 1])<CR>
vnoremap <silent> <Leader>ap{ :call<C-U>call Try(1, "SelectNext", ['{', '', '}', 'a', 1])<CR>

noremap <silent> <Leader>in< :call Try(0, "SelectNext", ['<', '', '>', 'i', 0])<CR>
vnoremap <silent> <Leader>in< :call<C-U>call Try(1, "SelectNext", ['<', '', '>', 'i', 0])<CR>
noremap <silent> <Leader>an< :call Try(0, "SelectNext", ['<', '', '>', 'a', 0])<CR>
vnoremap <silent> <Leader>an< :call<C-U>call Try(1, "SelectNext", ['<', '', '>', 'a', 0])<CR>
noremap <silent> <Leader>ip< :call Try(0, "SelectNext", ['<', '', '>', 'i', 1])<CR>
vnoremap <silent> <Leader>ip< :call<C-U>call Try(1, "SelectNext", ['<', '', '>', 'i', 1])<CR>
noremap <silent> <Leader>ap< :call Try(0, "SelectNext", ['<', '', '>', 'a', 1])<CR>
vnoremap <silent> <Leader>ap< :call<C-U>call Try(1, "SelectNext", ['<', '', '>', 'a', 1])<CR>

noremap <silent> <Leader>indo :call Try(0, "SelectNext", [g:ruby_block_start, '', g:ruby_block_end, 'i', 0])<CR>
vnoremap <silent> <Leader>indo :call<C-U>call Try(1, "SelectNext", [g:ruby_block_start, '', g:ruby_block_end, 'i', 0])<CR>
noremap <silent> <Leader>ando :call Try(0, "SelectNext", [g:ruby_block_start, '', g:ruby_block_end, 'a', 0])<CR>
vnoremap <silent> <Leader>ando :call<C-U>call Try(1, "SelectNext", [g:ruby_block_start, '', g:ruby_block_end, 'a', 0])<CR>
noremap <silent> <Leader>ipdo :call Try(0, "SelectNext", [g:ruby_block_start, '', g:ruby_block_end, 'i', 1])<CR>
vnoremap <silent> <Leader>ipdo :call<C-U>call Try(1, "SelectNext", [g:ruby_block_start, '', g:ruby_block_end, 'i', 1])<CR>
noremap <silent> <Leader>apdo :call Try(0, "SelectNext", [g:ruby_block_start, '', g:ruby_block_end, 'a', 1])<CR>
vnoremap <silent> <Leader>apdo :call<C-U>call Try(1, "SelectNext", [g:ruby_block_start, '', g:ruby_block_end, 'a', 1])<CR>

