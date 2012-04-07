au FileType mail set tw=75
au FileType mail map OR :w<CR>:!~/bin/mail-lint %<CR>:e<CR>
hi def link mailQuoted1		Type

