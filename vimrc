syntax on
execute pathogen#infect()
call pathogen#helptags()
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=2
set t_Co=256
set number
colorscheme desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=0 ctermfg=NONE

set tabstop=4
set expandtab
set scrolloff=12
set autoindent

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts = 1
set ttimeoutlen=10
