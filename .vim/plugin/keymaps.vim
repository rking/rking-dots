au BufNewFile,BufRead *.t set ft=perl
au BufNewFile,BufRead * silent !screentitle $(basename %)

map \] :up<UP><CR>
map \\ :noh<cr>:set nopaste<cr>:set nolist<cr>
map \p :set paste<cr>
map \v :!vim .vimrc<cr>:so .vimrc<cr>
map \V :!vim ~/.vimrc<cr>:so ~/.vimrc<cr>
map \vf :!vim <cword><cr>:so <cword><cr>

map \# :s/^/#/g<cr>:noh<cr>
map \$ :s/^#//g<cr>:noh<cr>

map \1 :up<cr>
map \2 :up<cr>:!perl -c -Ilib %<cr>
map \3 :up<cr>:call RunLastT()<cr>
map \4 :up<cr>:!make test<cr>
map \5 :up<cr>:!./%<cr>
map \6 :up<cr>:!make all install<cr>
map \7 :call ToggleSecondLang()<cr>
imap <f7> <esc>:call ToggleSecondLang()<cr>a

map \d :.!echo -n 'date:    '; date<cr>
map + :e #<cr>
map \h :up<cr>:call TryPerlCompile()<cr>

map \gf :sp <cword><cr>
map \c256 :let $TERM='xterm-256'<cr>:set t_Co=256<cr>:so ~/.inkpot.vim<cr>
