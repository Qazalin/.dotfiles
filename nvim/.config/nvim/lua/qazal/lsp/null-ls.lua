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
                    join_multiple_lines: true, \
                    blank_lines_between_top_level_imports_and_variables: false, \
                    blank_line_before_nested_class_or_def: false, \
                }",
			},
		}),
	},
})
