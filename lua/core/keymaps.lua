local setKeymap = vim.keymap.set

vim.g.mapleader = " "
vim.g.localmapleader = " "

-- NetRW
setKeymap("n", "-", "<cmd>Ex<CR>", { desc = "Open NetRW" })
-- TODO: is this useful? Is it LSP or plugin scoped?
setKeymap("n", "<leader><Tab>", "<C-^>", { desc = "Alt File" })

-- Resizing
setKeymap("n", "<Up>", "<cmd>resize +2<CR>", { noremap = true, silent = true })
setKeymap("n", "<Down>", "<cmd>resize -2<CR>", { noremap = true, silent = true })
setKeymap("n", "<Left>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true })
setKeymap("n", "<Right>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true })

-- Center when scrolling
setKeymap("n", "<C-d>", "<C-d>zz", { noremap = true })
setKeymap("n", "<C-u>", "<C-u>zz", { noremap = true })

-- Buffer management
setKeymap("n", "<leader>bd", "<cmd>%bd!<CR>", { desc = "Close all buffers" })
setKeymap("n", "<leader>bo", "<cmd>%bd!|e#|bd#<CR>", { desc = "Close all other buffers" })

-- Buffer settings
setKeymap("n", "<leader>w", "<cmd>set wrap<CR>", { desc = "Wrap text on" })
setKeymap("n", "<leader>W", "<cmd>set nowrap<CR>", { desc = "Wrap text off" })

-- Formatting
setKeymap("n", "<leader>fb", ":lua vim.lsp.buf.format()<CR>", { desc = "Format buffer" })
-- TODO: format selection

-- Clear search highlighting
setKeymap("n", "<esc>", "<cmd>noh<CR>", { noremap = true, silent = true })

