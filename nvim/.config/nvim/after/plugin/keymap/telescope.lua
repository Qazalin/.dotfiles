local Remap = require("qazal.keymap")
local nnoremap = Remap.nnoremap
local builtin = require("telescope.builtin")

nnoremap("<leader>pf", builtin.find_files)
nnoremap("<C-p>", builtin.git_files)
nnoremap("<leader>ps", function()
	builtin.grep_string({
		search = vim.fn.input("Grep For > "),
	})
end)

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
})
