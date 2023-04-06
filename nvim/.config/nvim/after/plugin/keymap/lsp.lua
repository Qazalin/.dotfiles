vim.keymap.set("n", "fmt", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true, noremap = true })
