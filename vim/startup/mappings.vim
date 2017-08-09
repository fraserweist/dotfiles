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
nmap <C-i> :tabnext<CR>
nmap <C-u> :tabprevious<CR>
imap <C-i> <ESC>:tabnext<CR>
imap <C-u> <ESC>:tabprevious<CR>
vmap <C-i> :tabnext<CR>
vmap <C-u> :tabprevious<CR>

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
