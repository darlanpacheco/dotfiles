vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-Right>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>m", ":Mason<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>tt", ":Telescope<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tf", ":ToggleTerm dir=./ direction=float<CR>", { noremap = true, silent = true })
