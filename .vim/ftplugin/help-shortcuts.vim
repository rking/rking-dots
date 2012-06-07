if &readonly
    nnoremap <silent><buffer> <Esc> :quit<CR>
    nnoremap <silent><buffer> <CR> <C-]>
    nnoremap <silent><buffer> <BS> <C-O>
    nnoremap <silent><buffer> <Down> :call search('\(''\<bar><bar>\)[^, <bar>]\{-1,}\1', 'W')<CR>
    nnoremap <silent><buffer> <Up> :call search('\(''\<bar><bar>\)[^, <bar>]\{-1,}\1', 'Wb')<CR>
endif
