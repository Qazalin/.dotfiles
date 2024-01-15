local Remap = require("qazal.keymap")
local nnoremap = Remap.nnoremap
local builtin = require("telescope.builtin")

nnoremap("<leader>pf", builtin.find_files)
nnoremap("<leader>h", "<cmd>Telescope harpoon marks<CR>")
nnoremap("<C-p>", builtin.git_files)
nnoremap("<C-G>", builtin.git_commits)
nnoremap("<leader>ps", function()
	builtin.grep_string({
		search = vim.fn.input("rg > "),
	})
end)
