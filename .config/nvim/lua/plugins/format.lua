local formatters = require("configs")[2]
require("conform").setup({
	formatters_by_ft = formatters,
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})