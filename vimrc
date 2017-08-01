syntax on
execute pathogen#infect()
call pathogen#helptags()
map <Leader>n <Plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=2
set t_Co=256
set number
colorscheme desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=0 ctermfg=NONE
if $TERM_PROGRAM =~ "iTerm.app"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

set tabstop=4
set expandtab
set shiftwidth=4
set scrolloff=12
set autoindent
function! <SID>RemoveTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>RemoveTrailingWhitespace()
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'
set ttimeoutlen=10
