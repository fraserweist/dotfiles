" colorful things come first!
syntax on
set t_Co=256
colorscheme desert

" line highlighting
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=233 ctermfg=NONE

" cursor shape
if $TERM_PROGRAM =~ "iTerm.app"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
