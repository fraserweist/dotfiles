" colorful things come first!
syntax on
set t_Co=256
set nohlsearch

" line highlighting

hi CtrlPMatch cterm=bold ctermfg=14 ctermbg=8

" cursor shape
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" " bar in insert
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" " block in normal
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " bar in insert
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " block in normal
endif
