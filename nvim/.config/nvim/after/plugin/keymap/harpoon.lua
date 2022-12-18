local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local Remap = require("qazal.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>a", mark.add_file)
nnoremap("<C-e>", ui.toggle_quick_menu)

nnoremap("<C-h>", function () ui.nav_file(1) end)
nnoremap("<C-t>", function () ui.nav_file(2) end)
nnoremap("<C-n>", function () ui.nav_file(3) end)
nnoremap("<C-s>", function () ui.nav_file(4) end)
