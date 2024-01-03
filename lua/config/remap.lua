vim.g.mapleader = " "

vim.keymap.set("n", "<leader>rw", vim.cmd.Ex, { desc = "Return to NetRw" })

-- Clear search highlighting
vim.keymap.set("n", "<leader>/", "<cmd>noh<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader><Tab>", "<C-^>", { desc = "Alt File" })

-- Resizing
vim.keymap.set("n", "<Up>", "<cmd>resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "<cmd>resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true })
