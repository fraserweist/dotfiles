" set leader key
let mapleader = ";"

" faster file saving
nmap <leader>w :w<CR>
nmap <leader>q :wqa<CR>

" unmap the arrow keys
nnoremap <up> ddkP
nnoremap <down> ddp
nnoremap <left> <Nop>
nnoremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>

" search wrap toggling
nmap <leader>nw :set nowrapscan<CR>
nmap <leader>yw :set wrapscan<CR>

" toggle cursorline
nnoremap <leader>c :let &cc = &cc == '' ? '80' : ''<CR>

" buffer navigation
nnoremap <C-y> :bprevious<CR>
nnoremap <C-o> :bnext<CR>
nnoremap <leader>x :bp <BAR> bd #<CR>

" nerdtree shortcut
map <leader>nn <Plug>NERDTreeTabsToggle<CR>

" fugitive shortcuts
nmap <leader>ga :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>i
nmap <leader>gp :Gpush<CR>

" vimux
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>

" ale error navigation
nmap <leader>ej :ALENext<CR>
nmap <leader>ek :ALEPrevious<CR>

" exit insert mode
imap jk <ESC>

" some unique debug syntax
nmap <leader>debug oprintf("DEBUG: \n");<ESC>Bi
