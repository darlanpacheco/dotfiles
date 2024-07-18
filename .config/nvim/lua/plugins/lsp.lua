local lsps = require("configs")[1]
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").capabilities

for _, lsp in ipairs(lsps) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end
