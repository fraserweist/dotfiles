" where are the plugins going to live?
call plug#begin('~/.vim/plugged')

" plugin list!
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'tpope/vim-surround'
Plug 'sukima/xmledit'

call plug#end()

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

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = { 'python': ['flake8'] }
let g:ale_linter_aliases = { 'xsd': ['xml'] }

hi ALEWarningSign ctermbg=11
hi ALEErrorSign ctermbg=9
hi ALEWarning ctermbg=11
hi ALEError ctermbg=9
