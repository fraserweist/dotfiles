set number          " show line numbers
set tabstop=4       " tabs are drawn as four spaces
set softtabstop=4   " backspace deletes four spaces
set shiftwidth=4    " using > or < moves four spaces
set expandtab       " tabs become spaces
set scrolloff=12    " always keep 12 lines between cursor and screen edge
set autoindent      " autoindent, why not?
set backspace=2     " backspace works like normal (deletes over line breaks)
set lazyredraw      " don't redraw during macros and shit like that
set rnu             " relative line number babayyyyy

" this automatically removes trailing whitespace when the file is saved
function! <SID>RemoveTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>RemoveTrailingWhitespace()
