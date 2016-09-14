let s:trigger = "<Leader><Leader>t"
let s:mappings = {}

"Motion
call extend(s:mappings, {
  \'h' : ':tabp<CR>',
  \'l' : ':tabn<CR>'
\})

"Lifecycle
call extend(s:mappings, {
  \'q': ':tabclose<CR>',
  \'Q': ':tabclose!<CR>',
  \'n': ':tabnew<CR>'
\})

"Moving tabs
call extend(s:mappings, {
  \'+': ':tabmove +1<CR>',
  \'>': ':tabmove +1<CR>',
  \'-': ':tabmove -1<CR>',
  \'<': ':tabmove -1<CR>'
\})

call extend(s:mappings, {
  \'<Esc>' : ':call QuickTabModeExit()<CR>',
  \s:trigger : ':call QuickTabModeExit()<CR>'
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
