
" TODO figure out if this deserves promotion to 1337-dots.
" (Thanks to https://github.com/MarcWeber/vim-addon-other/)
for i in range(char2nr(' '), char2nr('~'))
  let c = nr2char(i)
  if '|' == c
    let c = '\\|'
  endif
  if '[' != c " '[' is part of ANSI escape sequences
    if 'o' != c " 'o' is also part of F1–F4s' escape sequences
      exec 'map <esc>'.c.' <m-'.c.'>'
    end
  end
endfor

" Quick windowing with Alt+Shift+<char>
for i in split('hjklfinqc_+', '.\zs')
  exec 'map <m-s-'.i.'> <c-w>'.i
endfor
map <m-s-w> <c-w><c-w>
map <m-s-z> ZZ
