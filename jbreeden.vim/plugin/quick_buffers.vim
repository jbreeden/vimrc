let s:trigger = "<Leader><Leader>b"

let s:mappings = {
  \'q': ':b #<CR>:bd #<CR>',
  \'Q': ':b! #<CR>:bd! #<CR>',
  \'1' : ':bfirst<CR>',
  \'2' : ':silent bfirst<CR>:bnext 1<CR>',
  \'3' : ':silent bfirst<CR>:bnext 2<CR>',
  \'4' : ':silent bfirst<CR>:bnext 3CR>',
  \'5' : ':silent bfirst<CR>:bnext 4<CR>',
  \'6' : 'silent :bfirst<CR>:bnext 5<CR>',
  \'7' : 'silent :bfirst<CR>:bnext 6<CR>',
  \'8' : 'silent :bfirst<CR>:bnext 7<CR>',
  \'9' : 'silent :bfirst<CR>:bnext 8<CR>',
  \'j': ':bnext<CR>',
  \'k': ':bprev<CR>',
  \'$': ':blast<CR>',
  \'w': ':w<CR>',
  \'n': ':new<CR>',
  \'N': ':vert new<CR>',
  \'<Esc>': ':call QuickBufferModeExit()<CR>',
  \'#': ':b #<CR>',
\}

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
