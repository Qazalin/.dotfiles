local present, tokyonight = pcall(require, "tokyonight")
if not present then
	return
end

tokyonight.setup({
	style = "storm",
	transparent = true,
	styles = { floats = "transparent" },
})

vim.cmd.colorscheme("tokyonight")
