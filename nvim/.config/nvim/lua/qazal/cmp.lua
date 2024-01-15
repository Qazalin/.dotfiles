local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		fields = { "abbr" },
		expandable_indicator = true,
		format = function(_, vim_item)
			return vim_item
		end,
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
})
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
