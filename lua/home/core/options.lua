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

-- Show ruler at col 80
opt.colorcolumn = "80"

-- True colors
opt.termguicolors = true
