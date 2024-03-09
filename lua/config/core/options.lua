local opt = vim.opt

-- Statusline
opt.laststatus = 3

-- Relative and Absolute numbers
opt.number = true
opt.relativenumber = true

-- Set tab and indent to 4 spaces
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Indent, don't wrap
opt.smartindent = true
opt.wrap = false

-- New panes open to the right or below
opt.splitright = true
opt.splitbelow = true

-- Show ruler
opt.colorcolumn = "80"
opt.cursorline = true

-- Show buffer full path
opt.winbar = "%=%m %f"

-- Smoother scrolling
opt.mouse = "a"
opt.scrolloff = 5

-- Yank to clipboard
vim.api.nvim_set_option("clipboard", "unnamed")
