local nnoremap = require("qazalin.keymap").nnoremap
local vnoremap = require("qazalin.keymap").vnoremap
local nmap = require("qazalin.keymap").nmap

-- General remaps
nnoremap("<leader>pv", "<cmd>Vex<CR>")
nnoremap("<C-p>", ":GFiles<CR>")
nnoremap("<leader>pf", ":Files<CR>")
nnoremap("<leader>Y", "gg+yG<CR>")
nnoremap("<leader>x", "!chmod +x %<CR>")
nnoremap("<leader>P", "o<esc>P<CR>")

-- Copy to my system clipboard
vnoremap("<leader>y", '"+y')
-- lsp commands
nmap("gd", "<Plug>(coc-definition)")
nmap("<silent> gy", "<Plug>(coc-type-definition)")
nnoremap("<silent> gi", "<Plug>(coc-implementation)")
nmap("gr", "<Plug>(coc-references)")
nnoremap("K", ":call CocAction('doHover')<CR>")

-- tmux sessions
nnoremap("<C-s>", ":silent !tmux neww ~/personal/productivity/tmux-sessionizer<CR>")
nnoremap("<C-f>", ":silent !tmux neww ~/personal/productivity/tmux-sessionfinder<CR>")
