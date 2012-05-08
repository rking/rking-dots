" Links for easy hopping (regenerate with: 3Gd}k!!sh -v):
"find" ~/.vim/ -type f | sed 's/^/" /'
" /home/rking/.vim/compiler/eruby.vim
" /home/rking/.vim/compiler/ruby.vim
" /home/rking/.vim/compiler/rubyunit.vim
" /home/rking/.vim/plugin/functionkeys.vim
" /home/rking/.vim/plugin/mail.vim
" /home/rking/.vim/plugin/colorscheme.vim
" /home/rking/.vim/plugin/basics.vim
" /home/rking/.vim/plugin/svn.vim
" /home/rking/.vim/plugin/diff.vim
" /home/rking/.vim/plugin/make.vim
" /home/rking/.vim/plugin/README
" /home/rking/.vim/plugin/keymaps.vim
" /home/rking/.vim/plugin/matchit.vim
" /home/rking/.vim/plugin/quicklang.vim
" /home/rking/.vim/autoload/rubycomplete.vim
" /home/rking/.vim/.VimballRecord
" /home/rking/.vim/spell/en.utf-8.add.spl
" /home/rking/.vim/spell/en.utf-8.add
" /home/rking/.vim/doc/matchit.txt
" /home/rking/.vim/.netrwhist
" /home/rking/.vim/vim-ruby-2007.05.07.vba
" /home/rking/.vim/indent/eruby.vim
" /home/rking/.vim/indent/ruby.vim
" /home/rking/.vim/colors/inkpot.vim
" /home/rking/.vim/syntax/eruby.vim
" /home/rking/.vim/syntax/ruby.vim
" /home/rking/.vim/.gitignore
" /home/rking/.vim/ftplugin/eruby.vim
" /home/rking/.vim/ftplugin/ruby.vim
" /home/rking/.vim/ftdetect/ruby.vim

" TODO, replace 'exrc' with https://github.com/MarcWeber/vim-addon-local-vimrc

fun! EnsureVamIsOnDisk(vam_install_path)
  if !filereadable(a:vam_install_path.'/vim-addon-manager/.git/config')
     \&& 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
    call mkdir(a:vam_install_path, 'p')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
    exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
  endif
endf

fun! SetupVAM()
  " Set advanced options like this:
  " let g:vim_addon_manager = {}
  " let g:vim_addon_manager['key'] = value
  " Hrm: ^ what is available?

  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  call EnsureVamIsOnDisk(vam_install_path)
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  let want = [
        \ 'ack',
        \ 'bad-whitespace',
        \ 'endwise',
        \ 'gitv',
        \ 'github:Raimondi/vim-transpose-words',
        \ 'github:kien/ctrlp.vim',
        \ ]
  " TODO:
  " let want += [ 'vim-addon-rdebug' ]
  " let want += [ 'vim-ruby-debugger' ]
  " let want += [ 'github:MarcWeber/vim-addon-ruby-debug-ide' ]
  call vam#ActivateAddons(want, {'auto_install' : 1})

  " How to find addon names?
  " - look up source from pool
  " - (<c-x><c-p> complete plugin names):
  " Also see section "2.2. names of addons and addon sources" in VAM's documentation
endfun
call SetupVAM()
