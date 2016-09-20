nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

let s:mappings = {}

"Motion
call extend(s:mappings, {
  \'j': '<C-w>j',
  \'k': '<C-w>k',
  \'h': '<C-w>h',
  \'l': '<C-w>l'
\})

"Resizing
call extend(s:mappings, {
  \'>': '<C-w>>',
  \'<': '<C-w><',
  \'-': '<C-w>-',
  \'+': '<C-w>+',
  \'=': '<C-w>='
\})

"Lifecycle functions
call extend(s:mappings, {
  \'q': ':q<CR>',
  \'Q': ':q!<CR>',
  \'c': ':close<CR>',
  \'w': ':w<CR>',
  \'s': ':source %<CR>',
  \'n': ':new<CR>',
  \'N': ':vert new<CR>',
  \'H': ':hide<CR>'
\})

"Moving
call extend(s:mappings, {
  \'x': '<C-W>x',
  \'r': '<C-W>r',
  \'R': '<C-W>R'
\})

"Scrolling
call extend(s:mappings, {
  \')': 'zl',
  \'(': 'zh'
\})

"Exit on Esc, but also if the insert command is given again.
"(Otherwise we clobber our own bindings... so the next time we
" exit we'll be resetting them to the wrong values)
call extend(s:mappings, {
  \'<Esc>': ':call QuickWindowModeExit()<CR>',
\})

if !exists('s:clobbered')
  let s:clobbered = {}
endif

function! QuickWindowMode()
  if QuickMode(s:mappings, s:clobbered)
    echo "In Quick Window Mode (<Esc> to exit)"
  endif
endfunction

function! QuickWindowModeExit()
  call QuickModeExit(s:clobbered)
  echo "Exited Quick Window Mode"
endfunction

nnoremap <Leader><Leader>w :call QuickWindowMode()<CR>
