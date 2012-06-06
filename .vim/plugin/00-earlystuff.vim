" https://github.com/tpope/vim-pathogen
call pathogen#infect() 

" Name aside, ryanking doesn't like yankring (for now).
" TODO: Find something else to let this use other than ^p, which blocks
" The very-useful ctrlp.vim
let loaded_yankring = 22
