call plug#begin()
Plug 'ghifarit53/tokyonight-vim'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set termguicolors

let g:tokyonight_style = "storm"
let g:tokyonight_transparent_background = 1
let g:tokyonight_enable_italic = 0

colorscheme tokyonight

set guicursor=
set nonu
set relativenumber

set noerrorbells

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd FileType python setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

set smartindent
set wrap

set noswapfile
set nobackup

let mapleader = " "
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <leader>pv :Ex<CR>
