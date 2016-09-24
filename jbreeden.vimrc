"Setup pathogen (a vim package manager) execute pathogen#infect()
execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader=","

let $PS1 = "(vim)" . $PS1
let $scratch="~/.vim/scratch"
let $snippex="~/.vim/snippex"

"Remember the long long ago
set history=1000

"Don't unload abandoned buffers, just hide them
set hidden

"Don't wrap lines
set nowrap

"Prefer git for backups
set nobackup

"Avoids swap files next to the file being edited
"Trailing // ensures unique file names for swap files
set dir=~/tmp//,/var/tmp//,/tmp//

"Unset compatability mode (enables vim features that are not compatible with vi)
set nocp

"Highlight all search results (use :noh to disable until next search)
set hlsearch

"Enable incremental sesarch
set incsearch

"Use relative numbering in the gutter (for easier jumps)
set relativenumber

"Auto indent new lines
set autoindent

"Show partially-entered commands in the status bar
set showcmd

"Show cursor position in status line
set ruler

"Show Tab & EOL (just here as a reminder)
"set list "set nolist

"Keep at least 1000 entries in the history
if &history < 1000
  set history=1000
endif

"Make search case insensitive by default
set ignorecase

"Make search case sensitive when it includes an uppercase char
set smartcase

"Open splits to the right of the current window
set splitright
