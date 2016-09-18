let s:trigger = "<Leader><Leader>t"
let s:mappings = {}

call extend(s:mappings, {
  \'h' : ':tabp<CR>',
  \'l' : ':tabn<CR>',
  \'1' : ':tabn 1<CR>',
  \'2' : ':tabn 2<CR>',
  \'3' : ':tabn 3<CR>',
  \'4' : ':tabn 4<CR>',
  \'5' : ':tabn 5<CR>',
  \'6' : ':tabn 6<CR>',
  \'7' : ':tabn 7<CR>',
  \'8' : ':tabn 8<CR>',
  \'9' : ':tabn 9<CR>',
  \'$' : ':tablast<CR>',
  \'q': ':tabclose<CR>',
  \'Q': ':tabclose!<CR>',
  \'n': ':tabnew<CR>',
  \'+': ':tabmove +1<CR>',
  \'>': ':tabmove +1<CR>',
  \'-': ':tabmove -1<CR>',
  \'<': ':tabmove -1<CR>',
  \'<Esc>' : ':call QuickTabModeExit()<CR>',
  \s:trigger : ':call QuickTabModeExit()<CR>',
\})

if !exists('s:clobbered')
  let s:clobbered = {}
endif

function! QuickTabMode()
  if QuickMode(s:mappings, s:clobbered)
    echo "In Quick Tab Mode (<Esc> to exit)"
  endif
endfunction

function! QuickTabModeExit()
  call QuickModeExit(s:clobbered)
  echo "Exited Quick Tab Mode"
endfunction

execute "nnoremap " . s:trigger . " :call QuickTabMode()<CR>"
