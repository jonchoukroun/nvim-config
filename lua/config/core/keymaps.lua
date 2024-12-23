vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Clear search highlighting
vim.keymap.set("n", "<esc>", "<cmd>noh<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader><Tab>", "<C-^>", { desc = "Alt File" })

-- Resizing
vim.keymap.set("n", "<Up>", "<cmd>resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "<cmd>resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true })

-- Center when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>bprev<CR>", { desc = "Previous buffer" })

-- Buffer management
vim.keymap.set("n", "<leader>bd", "<cmd>%bd<CR>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all other buffers" })
