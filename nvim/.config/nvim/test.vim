set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" for vim devicons plugin
set encoding=UTF-8
set guifont=font-hack-nerd-font:h11

let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }


" general
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'pantharshit00/vim-prisma'
Plug 'dense-analysis/ale'
Plug 'github/copilot.vim'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf.vim'
Plug 'mhartington/oceanic-next'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'vim-scripts/AutoComplPop'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" rust
Plug 'rust-lang/rust.vim'

" python
Plug 'ambv/black'

" go
Plug 'darrikonn/vim-gofmt'

" solidity
Plug 'tomlion/vim-solidity'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production && yarn add prettier-plugin-solidity',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'solidity'] }
" Prettier config
let g:prettier#exec_cmd_path = '~/.vim/plugged/vim-prettier/node_modules/.bin/prettier'
let g:prettier#autoformat = 0
autocmd BufWritePre *.sol Prettier

" ts & js
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" gql
Plug 'jparise/vim-graphql'

" im a designer baby
Plug 'chrisbra/Colorizer'

call plug#end()

set nocompatible

if (has("termguicolors"))
    set termguicolors
endif

" colorscheme OceanicNext
" colorscheme nightfly
colorscheme tokyonight

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme

au BufRead,BufNewFile *.cash *.sol  setfiletype solidity

filetype on
filetype indent on
filetype plugin on
if has("syntax")
    syntax on
endif
filetype plugin indent on


let mapleader = " "
" Project View (pv)
nnoremap <leader>pv :Vex<CR>
" source vimrc
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>

" Navigation
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
" Jump to the prev file in a tree
" TBD (action: ctl shift 6)
" Going through a quickfix list
" https://frontendmasters.com/courses/vim-fundamentals/quickfix/
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
" Yank all the line
nnoremap <leader>Y gg"+yG
" Make a file executable
nnoremap <leader>x :!chmod +x %<CR>
" write, source and pluginstall
nnoremap <leader>I :w<CR> :source ~/.config/nvim/init.vim<CR> :PlugInstall<CR>
" Make a new line, leave insert mode and paste what I've yanked
nnoremap <leader>P o<esc>P<CR>
" Yank the thing I've selected and keep it in the history
vnoremap <leader>p "_dP
" Copy to my system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Copy the whole file to my system clipboard

" move it to the outside of the highlighter region and the re-highlight it
" The = sign automatically indents them
" Move the highlighed region up
vnoremap J :m '>+1<CR>gv=gv
" Move the highlighed region down
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>Y gg"+yG

" tmux sessionizer
nnoremap <silent> <C-s> :silent !tmux neww ~/personal/productivity/tmux-sessionizer<CR>
nnoremap <silent> <C-f> :silent !tmux neww ~/personal/productivity/tmux-sessionfinder<CR>

" ts lsp
" GoTo code navigation.
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call CocAction('doHover')<CR>
" sometimes eslint dies
" nnoremap <silent> <C-R> :CocCommand eslint.restart<CR>

" give me the colors
nnoremap <silent><leader>c :ColorHighlight<CR>
" view md file
nnoremap <silent><leader>md :MarkdownPreview<CR>
let g:mkdp_markdown_css = '~/personal/productivity/markdown.css'
nnoremap <leader>goe oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>
nnoremap <buffer><silent> <c-q> <cmd>call Black()<cr>

let g:rustfmt_autosave = 1
let g:gofmt_autosave = 1

" let g:ale_fix_on_save = 1
" https://blog.colinarms.com/automatically-remove-unused-imports-and-variables-in-vim-using-ale-and-eslint
