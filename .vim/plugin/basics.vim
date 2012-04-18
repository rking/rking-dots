syntax on

set incsearch ignorecase smartcase history=9999 ruler backspace=2
set autoindent expandtab tabstop=8 shiftwidth=4 softtabstop=4 textwidth=78
set autoread autowrite nobackup exrc ttyfast viminfo='20,\"500
set backspace=indent,eol,start hlsearch notimeout clipboard=
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.class wildmode=list:longest,full
set encoding=utf-8 termencoding=utf-8 " digraph keymap=greek iminsert=0
set modeline
set notitle " was messing up wmctrl's ability to pick out a window.

filetype plugin indent on

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
