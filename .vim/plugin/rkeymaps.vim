" TODO - Figure out what still has its deps.

" TODO - Move to ../perl-dots
au BufNewFile,BufRead *.t set ft=perl

" TODO - Move to ../vim-dots, I think.
map <leader>p :set paste<cr>
map <leader>v :!vim .vimrc<cr>:so .vimrc<cr>
map <leader>V :!vim ~/.vimrc<cr>:so ~/.vimrc<cr>
map <leader>vf :!vim <cword><cr>:so <cword><cr>
map <leader>gf :sp <cfile><cr>

" TODO - Move this to ../vim-dots, pull in ingy's acmeist stuff for it.
map <leader># :s/^/#/g<cr>:noh<cr>
map <leader>$ :s/^#//g<cr>:noh<cr>

" TODO - Move to ../vim-dots/.vim/vim-dots-keybindings.vim
" TODO - Acmeize the perlish bits.
map <leader>1 :up<cr>
map <leader>2 :up<cr>:!perl -c -Ilib %<cr>
map <leader>3 :up<cr>:call RunLastT()<cr>
map <leader>4 :wa<bar>:call MakeOrRakeOrWhatever()<cr>
map <leader>5 :wa<bar>:call RunThis()<cr>
" Should call MakeOrRakeOrWhatever("install")
map <leader>6 :up<cr>:!make all install<cr>

" TODO - Probably remove. =\
map <leader>7 :call ToggleSecondLang()<cr>
imap <f7> <esc>:call ToggleSecondLang()<cr>a

" TODO - move to ../vim-dots/.vim/plugin/betterdefaults.vim
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

map <leader>d :.!echo -n 'date:    '; date<cr>

