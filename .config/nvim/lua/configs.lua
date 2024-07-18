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
vim.g.rustfmt_autosave = true
vim.g.dart_format_on_save = true

local lspsformatters = {
	{
		"sqls",
		"rust_analyzer",
		"clangd",
		"pylsp",
		"bashls",
		"html",
		"cssls",
		"ts_ls",
		"tailwindcss",
		"lua_ls",
	},
	{
		sql = { "sqlformat" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		xml = { "xmlformat" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		python = { "black" },
		bash = { "shfmt" },
		html = { "prettier" },
		css = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		lua = { "stylua" },
	},
}

return lspsformatters
