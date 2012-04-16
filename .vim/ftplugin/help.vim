if &readonly
    nnoremap <CR> <C-]>
    nnoremap <BS> <C-O>
    nnoremap <Down> /\('\<bar><bar>\)[^, <bar>]\{-1,}\1<CR>:nohl<cr>
    nnoremap <Up> ?\('\<bar><bar>\)[^, <bar>]\{-1,}\1<CR>:nohl<cr>
endif
