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

vnoremap <Leader>xs :<Home>silent <End>Scratch<CR>
vnoremap <Leader>xvs :<Home>silent <End>Scratch v<CR>
vnoremap <Leader>xts :<Home>silent <End>Scratch t<CR>
vnoremap <Leader>xvts :<Home>silent <End>Scratch vt<CR>
vnoremap <Leader>xf :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!
vnoremap <Leader>xvf :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!
vnoremap <Leader>xtf :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!
vnoremap <Leader>xvtf :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!

"Ruby Specific
vnoremap <Leader>xR :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!ruby<CR>
vnoremap <Leader>xvR :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!ruby<CR>
vnoremap <Leader>xtR :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!ruby<CR>
vnoremap <Leader>xvtR :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!ruby<CR>

"Python Specific
vnoremap <Leader>xP :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!python<CR>
vnoremap <Leader>xvP :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!python<CR>
vnoremap <Leader>xtP :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!python<CR>
vnoremap <Leader>xvtP :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!python<CR>

"Bash Specific
vnoremap <Leader>xB :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!bash<CR>
vnoremap <Leader>xvB :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!bash<CR>
vnoremap <Leader>xtB :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!bash<CR>
vnoremap <Leader>xvtB :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!bash<CR>

"JavaScript Specific
vnoremap <Leader>xJ :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!node<CR>
vnoremap <Leader>xvJ :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!node<CR>
vnoremap <Leader>xtJ :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!node<CR>
vnoremap <Leader>xvtJ :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!node<CR>

"Ex Specific
vnoremap <Leader>xE :<Home>silent <End>Scratch<CR>:SelectAll<CR>:!ex<CR>
vnoremap <Leader>xvE :<Home>silent <End>Scratch v<CR>:SelectAll<CR>:!ex<CR>
vnoremap <Leader>xtE :<Home>silent <End>Scratch t<CR>:SelectAll<CR>:!ex<CR>
vnoremap <Leader>xvtE :<Home>silent <End>Scratch vt<CR>:SelectAll<CR>:!ex<CR>
