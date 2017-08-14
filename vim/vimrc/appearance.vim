" colorful things come first!
syntax on
set t_Co=256

" line highlighting
set cursorline
hi LineNR term=NONE cterm=NONE guibg=Grey40 ctermbg=NONE ctermfg=1
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=236 ctermfg=NONE
hi CursorLineNR term=bold cterm=bold guibg=Grey40 ctermbg=236 ctermfg=9
hi Directory guifg=#0000FF ctermfg=123

" cursor shape
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" " bar in insert
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" " block in normal
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " bar in insert
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " block in normal
endif
