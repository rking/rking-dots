au FileType diff set iskeyword+=. iskeyword+=/ iskeyword+=-
au FileType diff map \fp :!prove -lv <cword><cr>
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
    \ | diffthis | wincmd p | diffthis
