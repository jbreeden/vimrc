"Unset compatability mode (enables vim features that are not compatible with vi)
set nocp

"Highlight all search results (use :noh to disable until next search)
set hlsearch 

"Use relative numbering in the gutter (for easier jumps)
set relativenumber

"Auto indent new lines
set autoindent

"Show partially-entered commands in the status bar
set showcmd

"Show Tab & EOL
"set list "set nolist

"Expand tabs into spaces
set expandtab

"Set width for `<` & `>` (shift selection / indent/unindent)
set shiftwidth=2

"Set tab width
set tabstop=2

"Keep at least 1000 entries in the history
if &history < 1000
  set history=1000
endif

