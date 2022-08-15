local nnoremap = require("qazalin.keymap").nnoremap
local vnoremap = require("qazalin.keymap").vnoremap
local nmap = require("qazalin.keymap").nmap

-- General remaps
nnoremap("<leader>pv", "<cmd>Vex<CR>")
nnoremap("<C-p>", ":GFiles<CR>")
nnoremap("<leader>pf", ":Files<CR>")
nnoremap("<leader>Y", ":gg+yG")
nnoremap("<leader>x", "!chmod +x %<CR>")
nnoremap("<leader>P", "o<esc>P<CR>")

-- Copy to my system clipboard
vnoremap("<leader>y", '"+y')
-- lsp commands
nmap("<silent>gd", "<Plug>(coc-definition)")
nmap("<silent>gy", "<Plug>(coc-type-definition)")
nmap("<silent>gi", "<Plug>(coc-implementation)")
nmap("<silent>gi", "<Plug>(coc-implementation)")
nmap("<silent>gr", "<Plug>(coc-references)")
nmap("<silent>K", ":CocAction('doHover')")

-- tmux sessions
nnoremap("<C-s>", ":silent !tmux neww ~/personal/productivity/tmux-sessionizer<CR>")
nnoremap("<C-f>", ":silent !tmux neww ~/personal/productivity/tmux-sessionfinder<CR>")
