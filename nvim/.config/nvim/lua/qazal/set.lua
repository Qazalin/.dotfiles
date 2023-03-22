vim.opt.guicursor = ""
vim.opt.nu = false
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

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
vim.g.copilot_assume_mapped = true
vim.g.neoformat_try_node_exe = 1

vim.g.neoformat_typescriptreact_prettier = { "prettier" }
vim.g.neoformat_enabled_typescript = { "prettier" }
vim.g.neoformat_enabled_sql = { "pg_format" }
vim.g.neoformat_enabled_solidity = {}
vim.api.nvim_command("autocmd BufWritePost * :lua vim.lsp.buf.format()")
