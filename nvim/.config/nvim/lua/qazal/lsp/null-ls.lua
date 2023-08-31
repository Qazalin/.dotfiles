require("null-ls").setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.sqlfmt,
		null_ls.builtins.formatting.stylua,
	},
})
