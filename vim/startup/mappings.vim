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
nmap <M-Tab> :tabnext<CR>
nmap <M-S-Tab> :tabprevious<CR>
imap <M-Tab> <ESC>:tabnext<CR>
imap <M-S-Tab> <ESC>:tabprevious<CR>
vmap <M-Tab> :tabnext<CR>
vmap <M-S-Tab> :tabprevious<CR>
