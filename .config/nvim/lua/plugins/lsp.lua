local lspconfig = require("lspconfig")

for _, lsp in ipairs(_G.lsps) do
	lspconfig[lsp].setup({})
end
