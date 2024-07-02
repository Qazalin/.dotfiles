local util = require("lspconfig.util")

local root_files = {
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	".git",
}

return {
	root_dir = util.root_pattern(unpack(root_files)),
	single_file_support = true,
}
