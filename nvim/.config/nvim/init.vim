" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'

call plug#begin('~/.config/nvim/plugged')

" productivity
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'
Plug 'mbbill/undotree'
" im a designer baby
Plug 'chrisbra/Colorizer'

" other
Plug 'vim-scripts/AutoComplPop'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" TODO delete this
Plug 'dense-analysis/ale'

" linters
Plug 'tell-k/vim-autopep8'
Plug 'rust-lang/rust.vim'
Plug 'pantharshit00/vim-prisma'
Plug 'darrikonn/vim-gofmt'
Plug 'tomlion/vim-solidity'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production && yarn add prettier-plugin-solidity',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'solidity', 'sql'] }
" Prettier config
let g:prettier#exec_cmd_path = '~/.vim/plugged/vim-prettier/node_modules/.bin/prettier'
let g:prettier#autoformat = 0

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jparise/vim-graphql'


call plug#end()


" Buffer configs
autocmd BufWritePre *.sol Prettier
autocmd BufWritePre *.py :call CocAction('format')
autocmd BufWritePre *.go :call CocAction('format')
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
au BufRead,BufNewFile *.sol  setfiletype solidity


" Colors
if (has("termguicolors"))
    set termguicolors
endif
colorscheme catppuccin

set t_Co=256
set termguicolors



" Remaps
let mapleader = " "

" Navigation
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>fv :Ex<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" TODO
" Jump to the prev file in a tree
" TBD (action: ctl shift 6)
" Going through a quickfix list
" https://frontendmasters.com/courses/vim-fundamentals/quickfix/
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" File editing
nnoremap <leader>Y gg"+yG
nnoremap <leader>x :!chmod +x %<CR>
" Make a new line, leave insert mode and paste what I've yanked
nnoremap <leader>P o<esc>P<CR>
" Yank the thing I've selected and keep it in the history
vnoremap <leader>p "_dP
" Copy to my system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Other
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>I :w<CR> :source ~/.config/nvim/init.vim<CR> :PlugInstall<CR>

" move it to the outside of the highlighter region and the re-highlight it
" The = sign automatically indents them
" Move the highlighed region down and up
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" tmux sessionizer
nnoremap <silent> <C-s> :silent !tmux neww ~/personal/productivity/tmux-sessionizer<CR>
nnoremap <silent> <C-f> :silent !tmux neww ~/personal/productivity/tmux-sessionfinder<CR>

" Typescript code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call CocAction('doHover')<CR>
" TODO sometimes eslint dies
" nnoremap <silent> <C-R> :CocCommand eslint.restart<CR>

" Code actions
nnoremap <silent> fmt :call CocAction('format')<CR>
nnoremap <leader>ca :call CocAction<CR>
nnoremap <leader>cm :call CocCommand<CR>

" give me the colors
nnoremap <silent><leader>c :ColorHighlight<CR>
" view md file
nnoremap <silent><leader>md :MarkdownPreview<CR>
let g:mkdp_markdown_css = '~/personal/productivity/markdown.css'

" TODO why don't this work
nnoremap <leader>goe oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>


" Global Variables
let g:rustfmt_autosave = 1
let g:gofmt_autosave = 1

" TODO
" let g:ale_fix_on_save = 1
" https://blog.colinarms.com/automatically-remove-unused-imports-and-variables-in-vim-using-ale-and-eslint
"let g:copilot_filetypes = {
"  \ 'sql': v:false,
"  \ }

let g:ycm_filetype_blacklist = {
            \ 'vim': 1,         
            \ 'lua': 1,         
            \ 'json': 1,        
            \ }

au FileType html let b:coc_root_patterns = ['.git', '.env', 'tailwind.config.js', 'tailwind.config.cjs']


lua << EOF
local present, catppuccin = pcall(require, "catppuccin")
if not present then return end

catppuccin.setup {
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	term_colors = true,
	transparent_background = false,
	compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
	},
	color_overrides = {
		latte = {
			base = "#E1EEF5",
		},
		mocha = {
			base = "#000000",
		},
	},
	highlight_overrides = {
		latte = function(latte)
			return {
				NvimTreeNormal = { bg = "#D1E5F0" },
			}
		end,
		mocha = function(mocha)
			return {
				NvimTreeNormal = { bg = mocha.none },
				CmpBorder = { fg = mocha.surface2 },
			}
		end,
	},
	integrations = {
		treesitter = true,
		nvimtree = true,
		dap = {
			enabled = true,
			enable_ui = true,
		},
		lsp_saga = true,
		neogit = true,
	},
}

vim.api.nvim_command "colorscheme catppuccin"
