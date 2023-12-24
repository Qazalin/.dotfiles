vim.opt.guicursor = ""
vim.opt.nu = false
vim.opt.relativenumber = true

vim.opt.errorbells = false

-- the number of spaces that represent one tab
vim.opt.tabstop = 4
-- the number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
vim.opt.softtabstop = 4
--  number of spaces used for each level of indentation when you auto-indent your code
vim.opt.shiftwidth = 4
-- whether Vim replaces tab characters with spaces
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

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.g.mapleader = " "

-- format on save
function custom_on_write()
	local ext = vim.fn.expand("%:e")
	local extensions_to_format = { "ts", "lua", "tsx" }
	for _, e in ipairs(extensions_to_format) do
		if ext == e then
			pcall(vim.lsp.buf.format)
			break
		end
	end
end

vim.api.nvim_command("autocmd BufWritePost * :lua custom_on_write()")

-- no statusline
vim.o.laststatus = 0
vim.g.netrw_banner = 0
