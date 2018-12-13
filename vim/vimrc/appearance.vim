" colorful things come first!
syntax on
set t_Co=256
set nohlsearch

" line highlighting
hi LineNR ctermfg=8 ctermbg=NONE
hi Cursor     ctermfg=NONE ctermbg=147    cterm=NONE
hi CursorLine cterm=bold ctermbg=8 ctermfg=NONE
hi CursorLineNR cterm=bold ctermbg=8 ctermfg=7

hi CtrlPMatch cterm=bold ctermfg=14 ctermbg=8

" cursor shape
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" " bar in insert
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" " block in normal
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " bar in insert
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " block in normal
endif

" highlighting for diff filenames
augroup filetypedetect
    au BufRead,BufNewFile Jenkinsfile set filetype=groovy
augroup END
