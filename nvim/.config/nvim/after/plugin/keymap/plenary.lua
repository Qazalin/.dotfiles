local Remap = require("qazal.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>t", function()
	local ext = vim.fn.expand("%:e")

	if ext == "lua" then
		return "<Plug>PlenaryTestFile"
	elseif ext == "rs" then
		vim.cmd(":!cargo test")
	elseif ext == "ts" then
		local fp = vim.fn.expand("%:p")
		vim.cmd(":!pnpm vitest run " .. fp)
	else
		print("No test command for ." .. ext .. " files")
	end
end, { expr = true })
