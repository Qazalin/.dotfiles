local Remap = require("qazal.keymap")
local nnoremap = Remap.nnoremap

M = {}

nnoremap("<leader>gs", vim.cmd.Git)
nnoremap("<leader>gl", ":Git log<CR>")
nnoremap("<leader>gd", ":Gdiffsplit<CR>")
function M.ship()
	M.toggled_ship = not M.toggled_ship
	if M.toggled_ship then
		vim.cmd("Git add .")
		vim.cmd("Git commit")
		vim.cmd("startinsert")
	else
		vim.cmd("q")
		M.toggled_ship = false
	end
end

nnoremap("<leader>ga", M.ship)
