"Setup pathogen (a vim package manager)
execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader=","

set dir-=.

"Unset compatability mode (enables vim features that are not compatible with vi)
set nocp

"Highlight all search results (use :noh to disable until next search)
set hlsearch

"Enable incremental sesarch
set incsearch

"Always use regex magic
nnoremap / /\v
vnoremap / /\v

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

"Expand tabs into spaces
set expandtab

"Set tab width
set tabstop=2
set softtabstop=2
set shiftwidth=2

"Set width for `<` & `>` (shift selection / indent/unindent)
set shiftwidth=2

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
