let s:trigger = "<Leader><Leader>l"
let s:mappings = {}

call extend(s:mappings, {
  \'n' : ':lnext<CR>',
  \'N' : ':lprev<CR>',
  \'o' : ':lopen<CR>',
  \'q' : ':lclose<CR>',
  \'}' : ':lnf<CR>',
  \'{' : ':lpf<CR>',
  \'0' : ':lfirst<CR>',
  \'$' : ':llast<CR>',
\})

call extend(s:mappings, {
  \'<Esc>' : ':call QuickLocationListModeExit()<CR>'
\})

if !exists('s:clobbered')
    let s:clobbered = {}
endif

function! QuickLocationListMode()
    if QuickMode(s:mappings, s:clobbered)
        echo "In Quick LocationList Mode (<Esc> to exit)"
    endif
endfunction

function! QuickLocationListModeExit()
    call QuickModeExit(s:clobbered)
    echo "Exited Quick LocationList Mode"
endfunction

execute "nnoremap " . s:trigger . " :call QuickLocationListMode()<CR>"
