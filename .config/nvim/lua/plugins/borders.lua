local function set_floating_window_border()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "*",
		callback = function()
			local buf = vim.api.nvim_get_current_buf()
			local win = vim.api.nvim_get_current_win()
			local win_opts = vim.api.nvim_win_get_config(win)
			if win_opts.relative ~= "" then
				vim.api.nvim_win_set_config(win, {
					border = "rounded",
				})
			end
		end,
	})
end
set_floating_window_border()

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

require("gitsigns").setup({
	preview_config = {
		border = "rounded",
	},
})
