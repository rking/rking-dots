" vim:ft=vim
map \sD :!svndiff<cr>

map \sd :!svndiff %<cr>
map \sld :!svnlastdiff %<cr>
map \sb :!svnblame %<cr>
map \sl :!svnlog %<cr>
map \sci :!svn ci %<cr>
map \sREVERT :!svn revert %<cr>:e<cr>

map \sfd :!svn diff <cword><cr>
map \sfld :!svnlastdiff <cword><cr>
map \sfb :!svnblame <cword><cr>
map \sfl :!svnlog <cword><cr>
map \sfci :!svn ci <cword><cr>
map \sfREVERT :!svn revert <cword><cr>
