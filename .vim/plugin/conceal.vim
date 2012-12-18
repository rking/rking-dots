if !has('conceal')
  echo "Wow, this is an old vim, according to ~/.vim/plugin/conceal.vim"
  finish
endif
set conceallevel=2
au Syntax ruby syntax match rubyOperator '<<' conceal cchar=«
