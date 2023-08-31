local null_ls = require("null-ls")
null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.sqlfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.yapf.with({
			extra_args = {
				-- https://github.com/google/yapf#knobs
				"--style",
				"{ \
                    based_on_style: google, \
                    column_limit: 120, \
                    indent_width: 2, \
                }",
			},
		}),
	},
})
