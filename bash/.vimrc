set guicursor=
set nonu
set relativenumber

set noerrorbells

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
autocmd FileType * setlocal tabstop=2 shiftwidth=2 expandtab

set smartindent
set wrap

set noswapfile
set nobackup

call plug#begin()
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

syntax on
set noshowmode
colorscheme catppuccin_mocha
set termguicolors
hi Normal guibg=NONE ctermbg=NONE

let mapleader = " "
nnoremap <leader>w :source %<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>u :UndotreeShow<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap Y yg$
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>x :!chmod +x %<CR>
nnoremap <C-s> :!tmux neww ~/utils/tmux-sessionizer.sh<CR>
nnoremap <C-f> :!tmux neww ~/utils/tmux-sessionfinder.sh<CR>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <C-p> :GFiles<CR>
