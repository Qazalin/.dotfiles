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
xnoremap("<leader>p", "\"_dP")

-- queen of remaps
nnoremap("<leader>v", "vt$")

-- second greatest remap ever
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>Y", "gg\"+yG")



-- DANGER, it actually deletes the parent dir instead of the dir u tell it to delete  nnoremap("<leader>D", "<cmd>!rm -rd '%:p'<CR>")

nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- tmux sessionizer
nnoremap("<C-s>", "<cmd>!tmux neww ~/personal/productivity/tmux-sessionizer<CR>", {silent = true})
nnoremap("<C-f>", "<cmd>!tmux neww ~/personal/productivity/tmux-sessionfinder<CR>", {silent = true})

nnoremap("<leader>c", "<cmd>ColorizerToggle<CR>")
nnoremap("fmt", "<cmd>Neoformat<CR>")
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
