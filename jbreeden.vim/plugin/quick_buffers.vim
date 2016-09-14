let s:trigger = "<Leader><Leader>b"

let s:mappings = {}

"Quit a buffer
call extend(s:mappings, {
  \'q': ':b #<CR>:bd #<CR>',
  \'Q': ':b #<CR>:bd! #<CR>'
\})

"Cycle through buffers
call extend(s:mappings, {
  \'j': ':bnext<CR>',
  \'l': ':bnext<CR>',
  \'k': ':bprev<CR>',
  \'h': ':bprev<CR>'
\})

call extend(s:mappings, {
  \'<Esc>': ':call QuickBufferModeExit()<CR>',
  \'<Leader><Leader>b': ':call QuickBufferModeExit()<CR>'
\})

if !exists('s:clobbered')
  let s:clobbered = {}
endif

function! QuickBufferMode()
  if QuickMode(s:mappings, s:clobbered)
    echo "In Quick Buffer Mode (<Esc> to exit)"
  endif
endfunction

function! QuickBufferModeExit()
  call QuickModeExit(s:clobbered)
  echo "Exited Quick Buffer Mode"
endfunction

execute "nnoremap " . s:trigger . " :call QuickBufferMode()<CR>"
