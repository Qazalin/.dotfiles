local present, catppuccin = pcall(require, "catppuccin")
if not present then
	return
end

catppuccin.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	term_colors = true,
	transparent_background = false,
	no_italic = true,
	no_bold = true,
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
	},
	color_overrides = {
		mocha = {
			base = "#000000",
		},
	},
	highlight_overrides = {
		mocha = function(C)
			return {
				TabLineSel = { bg = C.pink },
				NvimTreeNormal = { bg = C.none },
				CmpBorder = { fg = C.surface2 },
				Pmenu = { bg = C.none },
				NormalFloat = { bg = C.none },
				IlluminatedWordText = { bg = "#111110" },
				IlluminatedWordRead = { bg = "#111110" },
				IlluminatedWordWrite = { bg = "#111110" },
			}
		end,
	},
})

vim.cmd.colorscheme("catppuccin")
