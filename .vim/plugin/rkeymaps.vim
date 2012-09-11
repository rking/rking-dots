" Hooks into ingy's handy :wa<up> deal:
map <f8> \]

" TODO - Figure out what still has its deps.

" TODO - Move to ../vim-dots, I think.
map <leader>p :set paste<cr>
map <leader>v :!vim .vimrc<cr>:so .vimrc<cr>
map <leader>V :!vim ~/.vimrc<cr>:so ~/.vimrc<cr>
map <leader>vf :!vim <cword><cr>:so <cword><cr>
map <leader>gf :sp <cfile><cr>

" TODO - Acmeize these perlish bits.
map <leader>2 :up<cr>:!perl -c -Ilib %<cr>
map <leader>3 :up<cr>:call RunLastT()<cr>
" Should call MakeOrRakeOrWhatever("install")
map <leader>6 :up<cr>:!make all install<cr>

" TODO - Probably remove. =\
map <leader>7 :call ToggleSecondLang()<cr>
imap <f7> <esc>:call ToggleSecondLang()<cr>a

" TODO - move to ../vim-dots/.vim/plugin/betterdefaults.vim

map <leader>d :.!echo -n 'date:    '; date<cr>

