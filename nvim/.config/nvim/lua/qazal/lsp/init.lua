require("qazal.lsp.neodev")

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("qazal.lsp.mason")
require("qazal.lsp.null-ls")
require("trouble").setup()

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
if not configs.rdna3_lsp then
	configs.rdna3_lsp = {
		default_config = {
			cmd = { "/Users/qazal/code/rdna3-lsp/target/release/rdna3" },
			filetypes = { "asm" },
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
			end,
			settings = {},
		},
	}
end
lspconfig.rdna3_lsp.setup({})
