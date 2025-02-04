vim.opt.guicursor = ""
vim.opt.nu = false
vim.opt.relativenumber = true

vim.opt.errorbells = false
vim.g.mapleader = " "

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.api.nvim_command("autocmd FileType python setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2")
vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.o.laststatus = 0
vim.g.netrw_banner = 0

vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "Y", "yg$", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>!tmux neww ~/utils/tmux-sessionizer.sh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", "<cmd>!tmux neww ~/utils/tmux-sessionfinder.sh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, silent = true })

-- catppuccin/nvim
cat = require("catppuccin")
cat.setup({
  flavour = "macchiato",
  transparent_background = true,
  no_italic = true,
})
vim.cmd.colorscheme("catppuccin")

-- nvim-telescope/telescope.nvim
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.git_files, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ps", function()
  builtin.grep_string({
    search = vim.fn.input("rg > "),
  })
end, { noremap = true, silent = true })

-- lewis6991/gitsigns.nvim
gs = require("gitsigns")
gs.setup({
	on_attach = function()
    vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame, { noremap = true, silent = true })
	end,
})

require("nvim-treesitter.configs").setup({
	auto_install = true,
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

-- harpoon!!!
require("harpoon").setup({
  save_on_toggle = false,
  save_on_change = true,
  enter_on_sendcmd = false,
})
local ui = require("harpoon.ui")
vim.keymap.set("n", "<C-h>", function () ui.nav_file(1) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", function () ui.nav_file(2) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", function () ui.nav_file(3) end, { noremap = true, silent = true })

local mark = require("harpoon.mark")
vim.keymap.set("n", "<leader>a", mark.add_file, { noremap = true, silent = true })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { noremap = true, silent = true })

-- m4xshen/autoclose.nvim
require("autoclose").setup()

-- jiaoshijie/undotree
local undotree = require("undotree")
undotree.setup()
vim.keymap.set('n', '<leader>u', undotree.toggle, { noremap = true, silent = true })
