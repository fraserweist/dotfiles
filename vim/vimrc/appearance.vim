" colorful things come first!
syntax on
set t_Co=256

" line highlighting
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=236 ctermfg=NONE
hi CursorLineNR term=bold cterm=bold guibg=Grey40 ctermbg=238
hi Directory guifg=#0000FF ctermfg=123

" cursor shape
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
