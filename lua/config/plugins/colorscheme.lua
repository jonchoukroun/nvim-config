return {
	"jonchoukroun/borland-colors",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		vim.cmd([[colorscheme borland]])
	end,
}
