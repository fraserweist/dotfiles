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

" tab navigation
nmap <C-o> :bnext<CR>
nmap <C-y> :bprevious<CR>
imap <C-o> <ESC>:bnext<CR>
imap <C-y> <ESC>:bprevious<CR>
vmap <C-o> :bnext<CR>
vmap <C-y> :bprevious<CR>
nmap <leader>bc :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" buffer navigation
nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>
imap <C-h> :wincmd h<CR>
imap <C-j> :wincmd j<CR>
imap <C-k> :wincmd k<CR>
imap <C-l> :wincmd l<CR>
vmap <C-h> :wincmd h<CR>
vmap <C-j> :wincmd j<CR>
vmap <C-k> :wincmd k<CR>
vmap <C-l> :wincmd l<CR>

" nerdtree shortcut (should this go in mappings?)
map <C-n> <Plug>NERDTreeTabsToggle<CR>
