local present, catppuccin = pcall(require, "catppuccin")
if not present then
	return
end

catppuccin.setup({
	flavour = "mocha", -- Can be one of: latte, frappe, macchiato, mocha
	background = { light = "latte", dark = "mocha" },
	dim_inactive = {
		enabled = false,
		-- Dim inactive splits/windows/buffers.
		-- NOT recommended if you use old palette (a.k.a., mocha).
		shade = "dark",
		percentage = 0.15,
	},
	transparent_background = true,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = true,
	styles = {
		comments = { "italic" },
		properties = { "italic" },
		functions = {},
		keywords = { "italic" },
		operators = { "bold" },
		conditionals = { "bold" },
		loops = { "bold" },
		booleans = { "bold", "italic" },
		numbers = {},
		types = {},
		strings = {},
		variables = {},
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		aerial = false,
		barbar = false,
		beacon = false,
		cmp = true,
		coc_nvim = false,
		dap = { enabled = true, enable_ui = true },
		dashboard = false,
		fern = false,
		fidget = true,
		gitgutter = false,
		gitsigns = true,
		harpoon = true,
		hop = true,
		illuminate = true,
		indent_blankline = { enabled = true, colored_indent_levels = false },
		leap = false,
		lightspeed = false,
		lsp_saga = true,
		lsp_trouble = true,
		markdown = true,
		mason = true,
		mini = false,
		navic = { enabled = false },
		neogit = false,
		neotest = false,
		neotree = { enabled = false, show_root = true, transparent_panel = false },
		noice = false,
		notify = true,
		nvimtree = true,
		overseer = false,
		pounce = false,
		semantic_tokens = false,
		symbols_outline = false,
		telekasten = false,
		telescope = true,
		treesitter_context = false,
		ts_rainbow = true,
		vim_sneak = false,
		vimwiki = false,
		which_key = true,
	},
	color_overrides = {
		mocha = {
			rosewater = "#ffe4e6",
			flamingo = "#EEBEBE",
			pink = "#f5d0fe",
			mauve = "#d8b4fe",
			red = "#f43f5e",
			maroon = "#EA999C",
			peach = "#EF9F76",
			yellow = "#ecfccb",
			green = "#bbf7d0",
			teal = "#99f6e4",
			sky = "#7dd3fc",
			sapphire = "#60a5fa",
			blue = "#93c5fd",
			lavender = "#a5b4fc",
			text = "#C6D0F5",
			subtext1 = "#B5BFE2",
			subtext0 = "#A5ADCE",
			overlay2 = "#949CBB",
			overlay1 = "#838BA7",
			overlay0 = "#737994",
			surface2 = "#626880",
			surface1 = "#51576D",
			surface0 = "#414559",
			base = "#030712",
			mantle = "#292C3C",
			crust = "#232634",
		},
	},
	highlight_overrides = {
		mocha = function(cp)
			return {
				-- For base configs.
				NormalFloat = { fg = cp.text, bg = false and cp.none or cp.base },
				Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
				IncSearch = { bg = cp.pink, fg = cp.surface1 },
				Keyword = { fg = cp.pink },
				Type = { fg = cp.peach },
				Typedef = { fg = cp.sky },
				StorageClass = { fg = cp.red, style = { "italic" } },

				-- For native lsp configs.
				DiagnosticVirtualTextError = { bg = cp.none },
				DiagnosticVirtualTextWarn = { bg = cp.none },
				DiagnosticVirtualTextInfo = { bg = cp.none },
				DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

				DiagnosticHint = { fg = cp.rosewater },
				LspDiagnosticsDefaultHint = { fg = cp.rosewater },
				LspDiagnosticsHint = { fg = cp.rosewater },
				LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
				LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

				-- For fidget.
				FidgetTask = { bg = cp.none, fg = cp.surface2 },
				FidgetTitle = { fg = cp.blue, style = { "bold" } },

				-- For trouble.nvim
				TroubleNormal = { bg = cp.base },

				-- For nvim cmp
				CmpBorder = { fg = cp.pink },

				-- For treesitter.
				["@field"] = { fg = cp.rosewater },
				["@property"] = { fg = cp.sky },

				["@include"] = { fg = cp.blue },
				["@operator"] = { fg = cp.sky },
				["@keyword.operator"] = { fg = cp.sky },
				["@punctuation.special"] = { fg = cp.maroon },

				["@float"] = { fg = cp.peach },
				["@number"] = { fg = cp.peach },
				["@boolean"] = { fg = cp.peach },

				["@constructor"] = { fg = cp.lavender },
				["@constant"] = { fg = cp.peach },
				["@conditional"] = { fg = cp.mauve },
				["@repeat"] = { fg = cp.mauve },
				["@exception"] = { fg = cp.peach },

				["@constant.builtin"] = { fg = cp.lavender },
				["@function.builtin"] = { fg = cp.peach, style = { "italic" } },
				["@type.builtin"] = { fg = cp.yellow, style = { "italic" } },
				["@type.qualifier"] = { link = "@keyword" },
				["@variable.builtin"] = { fg = cp.flamingo, style = { "italic" } },

				["@function"] = { fg = cp.lavender },
				["@function.macro"] = { fg = cp.red, style = {} },
				["@parameter"] = { fg = cp.pink },
				["@keyword"] = { fg = cp.flamingo, style = { "italic" } },
				["@keyword.function"] = { fg = cp.maroon },

				["@text.note"] = { fg = cp.base, bg = cp.blue },
				["@text.warning"] = { fg = cp.base, bg = cp.yellow },
				["@text.danger"] = { fg = cp.base, bg = cp.red },
				["@constant.macro"] = { fg = cp.mauve },

				["@label"] = { fg = cp.blue },
				["@method"] = { fg = cp.sapphire, style = { "italic" } },
				["@namespace"] = { fg = cp.flamingo, style = {} },

				["@punctuation.delimiter"] = { fg = cp.teal },
				["@punctuation.bracket"] = { fg = cp.overlay2 },
				["@string.regex"] = { fg = cp.peach },
				["@type"] = { fg = cp.yellow }, -- types, classes, enums
				["@variable"] = { fg = cp.text },
				["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
				["@tag"] = { fg = cp.peach },
				["@tag.delimiter"] = { fg = cp.maroon },
				["@text"] = { fg = cp.text },

				["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
				["@text.literal"] = { fg = cp.teal, style = { "italic" } },
				["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
				["@text.title"] = { fg = cp.blue, style = { "bold" } },
				["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
				["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
				["@string.escape"] = { fg = cp.pink },

				["@property.toml"] = { fg = cp.blue },
				["@field.yaml"] = { fg = cp.blue },

				["@label.json"] = { fg = cp.blue },

				["@function.builtin.bash"] = { fg = cp.red, style = { "italic" } },
				["@parameter.bash"] = { fg = cp.sky, style = { "italic" } },

				["@field.lua"] = { fg = cp.lavender },
				["@constructor.lua"] = { fg = cp.flamingo },
				["@variable.builtin.lua"] = { fg = cp.flamingo, style = { "italic" } },

				["@property.typescript"] = { fg = cp.mauve, style = { "italic" } },
				["@constructor.typescript"] = { fg = cp.lavender },

				["@constructor.tsx"] = { fg = cp.lavender },
				["@tag.attribute.tsx"] = { fg = cp.mauve },

				["@type.css"] = { fg = cp.lavender },
				["@property.css"] = { fg = cp.sky, style = { "italic" } },

				["@symbol"] = { fg = cp.flamingo },
			}
		end,
	},
})

vim.cmd.colorscheme("catppuccin")
