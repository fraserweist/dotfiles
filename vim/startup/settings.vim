" basic settings (tabs, indentation, show line numbers, scroll offset)
set number
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=12
set autoindent
set backspace=2

" this automatically removes trailing whitespace when the file is saved
function! <SID>RemoveTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>RemoveTrailingWhitespace()
