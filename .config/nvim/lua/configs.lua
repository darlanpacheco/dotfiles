vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10
vim.opt.laststatus = 0
vim.g.zig_fmt_autosave = true
vim.g.rustfmt_autosave = true
vim.g.dart_format_on_save = true

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = true,
	update_in_insert = true,
	signs = false,
	underline = false,
})

_G.lsps = {
	"zls",
	"rust_analyzer",
	"clangd",
	"bashls",
	"html",
	"cssls",
	"ts_ls",
	"tailwindcss",
	"lua_ls",
	"pyright",
}
_G.formatters = {
	c = { "clang-format" },
	cpp = { "clang-format" },
	bash = { "shfmt" },
	html = { "prettier" },
	css = { "prettier" },
	javascript = { "prettier" },
	typescript = { "prettier" },
	javascriptreact = { "prettier" },
	typescriptreact = { "prettier" },
	json = { "prettier" },
	lua = { "stylua" },
	python = { "black" },
}
_G.border_style = "single"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
