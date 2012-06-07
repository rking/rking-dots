" TODO - Organize & atomicize.
" Also figure out what still has its deps.

au BufNewFile,BufRead *.t set ft=perl

map <leader>p :set paste<cr>
map <leader>v :!vim .vimrc<cr>:so .vimrc<cr>
map <leader>V :!vim ~/.vimrc<cr>:so ~/.vimrc<cr>
map <leader>vf :!vim <cword><cr>:so <cword><cr>
map <leader>gf :sp <cfile><cr>

map <leader># :s/^/#/g<cr>:silent noh<cr>
map <leader>$ :s/^#//g<cr>:silent noh<cr>

" TODO - Acmeize the perlish bits.
map <leader>1 :silent up<cr>
map <leader>2 :silent up<cr>:!perl -c -Ilib %<cr>
map <leader>3 :silent up<cr>:call RunLastT()<cr>
map <leader>4 :silent up<cr>:call MakeOrRakeOrWhatever()<cr>
map <leader>5 :silent up<cr>:call RunThis()<cr>
map <leader>6 :silent up<cr>:!make all install<cr>
map <leader>7 :silent call ToggleSecondLang()<cr>
imap <f7> <esc>:call ToggleSecondLang()<cr>a

map <leader>d :.!echo -n 'date:    '; date<cr>

" Allow undo for Insert Mode ^u (thanks, osse!) - see: :help i_CTRL-G_u
inoremap <C-u> <C-g>u<C-u>

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
