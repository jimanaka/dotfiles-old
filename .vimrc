" General
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number
set relativenumber
set termguicolors
colorscheme catppuccin_mocha
set mouse=a
set noswapfile


" Insert
inoremap jk <ESC>
inoremap kj <ESC>

" Normal
" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Line navigation
nnoremap j gj
nnoremap k gk

" Buff navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

