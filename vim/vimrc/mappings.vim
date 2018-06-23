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

" buffer navigation
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <leader>x :bp <BAR> bd #<CR>

" window navigation
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>

" nerdtree shortcut
map <leader>nn <Plug>NERDTreeTabsToggle<CR>

" fugitive shortcuts
nmap <leader>ga :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>i
nmap <leader>gp :Gpush<CR>

" nicely formatted curly braces
imap <C-{> {<CR><CR>}<ESC>kA<Tab>

" some unique debug syntax
nmap <leader>debug oprintf("DEBUG: \n");<ESC>Bi
