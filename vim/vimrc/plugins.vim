" pathogen takes control
execute pathogen#infect()
call pathogen#helptags()

" nerdtree
let g:nerdtree_tabs_open_on_console_startup = 2

" airline
let g:airline_theme = 'fraser'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
set ttimeoutlen=10

" vimux
let g:VimuxUseNearest = 1
