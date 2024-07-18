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
		"html",
		"cssls",
		"tsserver",
		"tailwindcss",
		"clangd",
		"rust_analyzer",
		"sqls",
		"bashls",
		"lua_ls",
	},
	{
		html = { "prettier" },
		css = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		xml = { "xmlformat" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		sql = { "sqlformat" },
		bash = { "shfmt" },
		lua = { "stylua" },
	},
}

return lspsformatters
