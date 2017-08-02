" pathogen takes control
execute pathogen#infect()
call pathogen#helptags()

" nerdtree
map <Leader>n <Plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=2

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'
set ttimeoutlen=10
