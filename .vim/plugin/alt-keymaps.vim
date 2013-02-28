" Quick windowing with Alt+Shift+<char>
for i in split('hjklfinqc_+', '.\zs')
  exec 'map <m-s-'.i.'> <c-w>'.i
endfor
map <m-s-w> <c-w><c-w>
map <m-s-z> ZZ
