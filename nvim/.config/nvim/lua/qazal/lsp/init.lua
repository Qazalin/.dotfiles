local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "qazal.lsp.mason"
require "qazal.lsp.handlers"
require "qazal.lsp.null-ls"