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

-- nnoremap("<leader>y", '"+y')
-- vnoremap("<leader>y", '"+y')
-- nnoremap("<leader>Y", 'gg"+yG')
function write_visual_select_to_file()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.fn.getline(start_pos[2], end_pos[2])
    if #lines == 0 then return end
    -- adjust the first line to start from the actual selection start
    lines[1] = string.sub(lines[1], start_pos[3], -1)
    -- adjust the last line to end at the actual selection end
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3] - start_pos[3])
    local file_path = vim.fn.expand("~/custom-clipboard")
    vim.fn.writefile(lines, file_path)
end
vim.api.nvim_set_keymap('v', '<leader>y', ':lua write_visual_select_to_file()<CR>', {noremap = true, silent = true})

nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
nnoremap("<leader><leader>w", "<cmd>w<CR><cmd>source %<CR>", { silent = true })

-- tmux sessionizer
nnoremap("<C-s>", "<cmd>!tmux neww ~/utils/tmux-sessionizer.sh<CR>", { silent = true })
nnoremap("<C-f>", "<cmd>!tmux neww ~/utils/tmux-sessionfinder.sh<CR>", { silent = true })

nnoremap("<leader>c", "<cmd>ColorizerToggle<CR>")
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- because ppl sometimes dont use a standard formatter
nnoremap("<leader>W", "<cmd>noa w<CR>")

-- write and source curr file
nnoremap("<leader>w", "<cmd>w<CR><cmd>source %<CR>", { silent = true })
