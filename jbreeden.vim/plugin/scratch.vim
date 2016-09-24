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

vnoremap <Leader>xs :Scratch<CR>
vnoremap <Leader>xvs :Scratch v<CR>
vnoremap <Leader>xts :Scratch t<CR>
vnoremap <Leader>xvts :Scratch vt<CR>
vnoremap <Leader>xf :Scratch<CR>:SelectAll<CR>:!
vnoremap <Leader>xvf :Scratch v<CR>:SelectAll<CR>:!
vnoremap <Leader>xtf :Scratch t<CR>:SelectAll<CR>:!
vnoremap <Leader>xvtf :Scratch vt<CR>:SelectAll<CR>:!

"Ruby Specific
vnoremap <Leader>xR :Scratch<CR>:SelectAll<CR>:!ruby<CR>
vnoremap <Leader>xvR :Scratch v<CR>:SelectAll<CR>:!ruby<CR>
vnoremap <Leader>xtR :Scratch t<CR>:SelectAll<CR>:!ruby<CR>
vnoremap <Leader>xvtR :Scratch vt<CR>:SelectAll<CR>:!ruby<CR>

"Python Specific
vnoremap <Leader>xP :Scratch<CR>:SelectAll<CR>:!python<CR>
vnoremap <Leader>xvP :Scratch v<CR>:SelectAll<CR>:!python<CR>
vnoremap <Leader>xtP :Scratch t<CR>:SelectAll<CR>:!python<CR>
vnoremap <Leader>xvtP :Scratch vt<CR>:SelectAll<CR>:!python<CR>

"Bash Specific
vnoremap <Leader>xB :Scratch<CR>:SelectAll<CR>:!bash<CR>
vnoremap <Leader>xvB :Scratch v<CR>:SelectAll<CR>:!bash<CR>
vnoremap <Leader>xtB :Scratch t<CR>:SelectAll<CR>:!bash<CR>
vnoremap <Leader>xvtB :Scratch vt<CR>:SelectAll<CR>:!bash<CR>

"JavaScript Specific
vnoremap <Leader>xJ :Scratch<CR>:SelectAll<CR>:!node<CR>
vnoremap <Leader>xvJ :Scratch v<CR>:SelectAll<CR>:!node<CR>
vnoremap <Leader>xtJ :Scratch t<CR>:SelectAll<CR>:!node<CR>
vnoremap <Leader>xvtJ :Scratch vt<CR>:SelectAll<CR>:!node<CR>

"Ex Specific
vnoremap <Leader>xE :Scratch<CR>:SelectAll<CR>:!ex<CR>
vnoremap <Leader>xvE :Scratch v<CR>:SelectAll<CR>:!ex<CR>
vnoremap <Leader>xtE :Scratch t<CR>:SelectAll<CR>:!ex<CR>
vnoremap <Leader>xvtE :Scratch vt<CR>:SelectAll<CR>:!ex<CR>
