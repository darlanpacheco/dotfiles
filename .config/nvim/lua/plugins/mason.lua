local lsps = require("configs")[1]
require("mason-lspconfig").setup({
	ensure_installed = lsps,
})
