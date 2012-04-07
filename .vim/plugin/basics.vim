syntax on

set incsearch ignorecase smartcase history=9999 ruler backspace=2
set autoindent expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=78
set autoread autowrite nobackup exrc ttyfast viminfo='20,\"500
set backspace=indent,eol,start hlsearch notimeout clipboard=
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.class wildmode=list:longest,full
set encoding=utf-8 termencoding=utf-8 " digraph keymap=greek iminsert=0

" t_Co=256 ?
"colorscheme darkblue "| set bg=dark

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" for iso-2022-jp: set termencoding=euc-jp encoding=japan fileencodings=iso-2020-jp,cp932,utf-8,japan
" Or just: iconv -f ISO2022JP2 -t UTF-8
