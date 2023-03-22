local Remap = require("qazal.keymap")
local nnoremap = Remap.nnoremap

require("gitsigns").setup({
	on_attach = function()
		local gs = package.loaded.gitsigns
		nnoremap("<leader>gb", gs.toggle_current_line_blame)
	end,
})
