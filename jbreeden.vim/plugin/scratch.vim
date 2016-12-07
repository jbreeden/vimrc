" Command Pattern:
"
" COMMAND -> <SELECTION_CLAUSE> <EXECUTION_CLAUSE>
" SELECTION_CLAUSE -> s v? t?
" EXECUTION_CLAUSE -> (s | f | <LANG>)
" LANG -> (s | f | R | P | B | J | E)
"
" Explanation:
"
" Leading s: "Scratch" mnemonic / plugin prefix
" Optional v: Open scratch buffer in a vertical split
" Optional t: Trim the virst token from each line in the scratch buffer
" LANG
"   - s: Copy text to new buffer (simplest scratch buffer creation)
"   - f: After creating the scratch buffer, select the copied text and
"        prepare to perform a filter command on it (which the user will
"        type next).
"   - OTHER: Capitalized LANG tokens filter the 
"
command! SelectAll 1
    \| execute "normal V"
    \| $

command! -range -nargs=? Scratch
    \| <line1>,<line2>y
    \| if match(<q-args>, 'v') >= 0
        \| vnew
    \| else
        \| new
    \| endif
    \| 0put
    \| if match(<q-args>, 't') >= 0
        \| let search = @/
        \| %s/\v\s*\S*\s?//
        \| let @/ = search
        \| noh
    \| endif
    \| '[

vnoremap <Leader>ss :<Home>silent <End>Scratch<CR>
vnoremap <Leader>svs :<Home>silent <End>Scratch v<CR>
vnoremap <Leader>sts :<Home>silent <End>Scratch t<CR>
vnoremap <Leader>svts :<Home>silent <End>Scratch vt<CR>
vnoremap <Leader>sf :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!
vnoremap <Leader>svf :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!
vnoremap <Leader>stf :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!
vnoremap <Leader>svtf :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!

"Ruby Specific
vnoremap <Leader>sR :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!ruby<CR>
vnoremap <Leader>svR :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!ruby<CR>
vnoremap <Leader>stR :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!ruby<CR>
vnoremap <Leader>svtR :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!ruby<CR>

"Python Specific
vnoremap <Leader>sP :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!python<CR>
vnoremap <Leader>svP :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!python<CR>
vnoremap <Leader>stP :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!python<CR>
vnoremap <Leader>svtP :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!python<CR>

"Bash Specific
vnoremap <Leader>sB :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!bash<CR>
vnoremap <Leader>svB :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!bash<CR>
vnoremap <Leader>stB :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!bash<CR>
vnoremap <Leader>svtB :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!bash<CR>

"JavaScript Specific
vnoremap <Leader>sJ :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!node<CR>
vnoremap <Leader>svJ :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!node<CR>
vnoremap <Leader>stJ :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!node<CR>
vnoremap <Leader>svtJ :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!node<CR>

"Ex Specific
vnoremap <Leader>sE :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!ex<CR>
vnoremap <Leader>svE :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!ex<CR>
vnoremap <Leader>stE :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!ex<CR>
vnoremap <Leader>svtE :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!ex<CR>
