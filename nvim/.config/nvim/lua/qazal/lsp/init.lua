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
