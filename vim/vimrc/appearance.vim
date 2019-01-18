" colorful things come first!
syntax on
set t_Co=256
set nohlsearch

" line highlighting
hi LineNR ctermfg=7
hi Cursor ctermfg=NONE ctermbg=147    cterm=NONE
hi CursorLine cterm=NONE ctermbg=8
hi CursorLineNR cterm=bold ctermbg=8 ctermfg=15
hi CtrlPMatch cterm=bold ctermfg=14 ctermbg=8

" cursor shape
if exists('$TMUX')
    " bar in insert
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    " block in normal
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    " bar in insert
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    " block in normal
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" highlighting for diff filenames
augroup filetypedetect
    au BufRead,BufNewFile Jenkinsfile set filetype=groovy
augroup END

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" 80 column mark
hi ColorColumn ctermbg=15
set colorcolumn=
