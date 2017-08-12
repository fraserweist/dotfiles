" pathogen takes control
execute pathogen#infect()
call pathogen#helptags()

" nerdtree
map <C-n> <Plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=2

" airline
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:gruvbox_contrast_dark = 'hard'
let g:airline#extensions#tabline#enabled = 1
set ttimeoutlen=10
