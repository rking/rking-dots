au BufNewFile,BufRead *.t set ft=perl
au BufNewFile,BufRead * silent !screentitle $(basename %)

map \] :silent up<UP><CR>
map \\ :silent noh<cr>:set nopaste nolist<cr>
map \p :set paste<cr>
map \v :!vim .vimrc<cr>:so .vimrc<cr>
map \V :!vim ~/.vimrc<cr>:so ~/.vimrc<cr>
map \vf :!vim <cword><cr>:so <cword><cr>

map \# :s/^/#/g<cr>:silent noh<cr>
map \$ :s/^#//g<cr>:silent noh<cr>

map \1 :silent up<cr>
map \2 :silent up<cr>:!perl -c -Ilib %<cr>
map \3 :silent up<cr>:call RunLastT()<cr>
map \4 :silent up<cr>:call MakeOrRakeOrWhatever()<cr>
map \5 :silent up<cr>:call RunThis()<cr>
map \6 :silent up<cr>:!make all install<cr>
map \7 :silent call ToggleSecondLang()<cr>
imap <f7> <esc>:call ToggleSecondLang()<cr>a

map \d :.!echo -n 'date:    '; date<cr>
map + :e #<cr>

" Allow undo for Insert Mode ^u (thanks, osse!)
inoremap <C-u> <C-g>u<C-u>

map \gf :sp <cword><cr>

func! MakeOrRakeOrWhatever()
    if filereadable('Rakefile')
        setlocal makeprg=rake
    elseif filereadable('Makefile')
        setlocal makeprg=make
    elseif filereadable('build.xml')
        setlocal makeprg=ant\ -emacs
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
