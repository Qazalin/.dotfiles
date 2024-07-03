local util = require("lspconfig.util")

local root_files = {
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	"pyrightconfig.json",
	".git",
}

return {
	default_config = {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_dir = function()
			return util.root_pattern(unpack(root_files))() or vim.loop.cwd()
		end,
		single_file_support = true,
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
					typeCheckingMode = "strict",
					autoImportCompletions = true,
				},
			},
		},
	},
}
