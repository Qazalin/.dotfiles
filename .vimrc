set guicursor=
set nonu
set number

set noerrorbells

filetype plugin indent on
autocmd FileType * setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType rust setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

set smartindent
set wrap

set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undo

call plug#begin()
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'zivyangll/git-blame.vim'
call plug#end()

syntax on
set noshowmode
colorscheme catppuccin_mocha
set termguicolors
hi Normal guibg=NONE ctermbg=NONE

let mapleader = " "
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
nnoremap <C-s> :!tmux neww ~/tmux-sessionizer.sh<CR>
nnoremap <C-f> :!tmux neww ~/tmux-sessionfinder.sh<CR>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-e> :Buffers<CR>
command! -bang -nargs=* Vex execute 'GFiles' <q-args>
nnoremap <C-h> <C-^>
inoremap <C-h> <C-^>
vnoremap <C-h> <C-^>
nnoremap <leader>gb :<C-u>call gitblame#echo()<CR>
