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
map \4 :up<cr>:call MakeOrRakeOrWhatever()<cr>
map \5 :up<cr>:call RunThis()<cr>
map \6 :up<cr>:!make all install<cr>
map \7 :call ToggleSecondLang()<cr>
imap <f7> <esc>:call ToggleSecondLang()<cr>a

map \d :.!echo -n 'date:    '; date<cr>
map + :e #<cr>
map \h :up<cr>:call TryPerlCompile()<cr>

" Allow undo for Insert Mode ^u (thanks, osse!)
inoremap <C-u> <C-g>u<C-u>

map \gf :sp <cword><cr>

func! MakeOrRakeOrWhatever()
    if filereadable('Makefile')
        setlocal makeprg=make
    elseif filereadable('Rakefile')
        setlocal makeprg=rake
    else
        call RunThis()
        return
    end
    make
endfunc

func! RunThis()
    " Otherwise, run it.
    if filereadable('./'.expand('%'))
        echo "a"
        !./%
    elseif filereadable(expand('%'))
        echo "b"
        !%
    else
        echo "Odd. Couldn't run ".expand('%')
    end
endfunc
