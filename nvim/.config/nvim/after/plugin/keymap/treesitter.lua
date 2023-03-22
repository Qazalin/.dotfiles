require("nvim-treesitter.configs").setup({
	ensure_installed = { "help", "javascript", "typescript", "lua", "rust", "python" },
	sync_install = false,
	auto_install = true,
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
