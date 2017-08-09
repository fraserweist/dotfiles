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
nmap <C-o> :tabnext<CR>
nmap <C-y> :tabprevious<CR>
imap <C-o> <ESC>:tabnext<CR>
imap <C-y> <ESC>:tabprevious<CR>
vmap <C-o> :tabnext<CR>
vmap <C-y> :tabprevious<CR>

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
