let s:trigger = "<Leader><Leader>c"
let s:mappings = {}

call extend(s:mappings, {
            \'n' : ':cnext<CR>',
            \'N' : ':cprev<CR>',
            \'o' : ':copen<CR>',
            \'q' : ':cclose<CR>',
            \'}' : ':cnf<CR>',
            \'{' : ':cpf<CR>',
            \'0' : ':cfirst<CR>',
            \'$' : ':clast<CR>',
            \})

call extend(s:mappings, {
            \'<Esc>' : ':call QuickQuickfixModeExit()<CR>',
            \s:trigger : ':call QuickQuickfixModeExit()<CR>'
            \})

if !exists('s:clobbered')
    let s:clobbered = {}
endif

function! QuickQuickfixMode()
    if QuickMode(s:mappings, s:clobbered)
        echo "In Quick Quickfix Mode (<Esc> to exit)"
    endif
endfunction

function! QuickQuickfixModeExit()
    call QuickModeExit(s:clobbered)
    echo "Exited Quick Quickfix Mode"
endfunction

execute "nnoremap " . s:trigger . " :call QuickQuickfixMode()<CR>"
