local Remap = require("qazal.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("Y", "yg$")
nnoremap("J", "mzJ`z")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- king of remaps
xnoremap("<leader>p", '"_dP')

-- queen of remaps
nnoremap("<leader>v", "vt$")

-- second greatest remap ever
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", 'gg"+yG')

nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
nnoremap("<leader><leader>w", "<cmd>w<CR><cmd>source %<CR>", { silent = true })

-- tmux sessionizer
nnoremap("<C-s>", "<cmd>!tmux neww ~/utils/tmux-sessionizer.sh<CR>", { silent = true })
nnoremap("<C-f>", "<cmd>!tmux neww ~/utils/tmux-sessionfinder.sh<CR>", { silent = true })

nnoremap("<leader>c", "<cmd>ColorizerToggle<CR>")
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
