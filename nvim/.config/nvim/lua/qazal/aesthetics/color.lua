local present, tokyonight = pcall(require, "tokyonight")
if not present then
	return
end

tokyonight.setup({
	style = "storm",
	transparent = true,
	styles = { floats = "transparent", functions = {} },
})

vim.cmd.colorscheme("tokyonight")
local baleia = require("baleia").setup({})
local function baleiaColorize()
	baleia.once(vim.fn.bufnr("%"))
end
vim.api.nvim_create_user_command("BaleiaColorize", baleiaColorize, {})
