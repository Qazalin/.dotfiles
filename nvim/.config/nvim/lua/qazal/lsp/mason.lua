local servers = {
	"lua_ls",
	"tsserver",
	"rust_analyzer",
	"tailwindcss",
	"gopls",
    "jedi_language_server"
}

require("mason").setup({ log_level = vim.log.levels.INFO })
require("mason-lspconfig").setup({})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("qazal.lsp.handlers").on_attach,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "qazal.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
