" This should be the vim default, I think:
au BufRead,BufNewFile *.t set ft=perl

let &path = "lib," . &path
set isfname+=: iskeyword+=:
setlocal keywordprg=perldoc equalprg=perltidy

setlocal makeprg=perl\ -wc\ %
" This is cool, but Spiffy doesn't comply:
" setlocal makeprg=perl\ -Wc\ %
setlocal errorformat=%m\ at\ %f\ line\ %l%.%#,
    \%-G%.%#

" usable as C-/
imap <C-_> ->
" make sure you have 'stty -ixon' set before you use this:
imap <C-s> $self->

map \if :!flip-if<cr>
map \gs :!grepsubs %<cr>

" Run the debugger on the current file (great for .t files)
map \D :up<cr>:!perl -d -Ilib %<cr>

" Ingy's got \# covered.
" map \# :s/^/#/g<cr>:noh<cr>
map \$ :s/^#\s?//g<cr>:noh<cr>

" You're on your own for finding a mapping for this.  I prefer:
" map <f3> :up<cr>:call RunLastT()<cr>
" imap <f3> <esc><f3>
function! RunLastT()
    if (expand('%:e') == 't')
        let $lasttfile = expand('%')
    endif
    if (!strlen($lasttfile))
       execute '!./' . expand('%')
    else
        !prove -lv $lasttfile
    endif
endf
