return {
	-- "morhetz/gruvbox",
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		-- vim.cmd([[colorscheme gruvbox]])
		vim.cmd([[colorscheme catppuccin]])
	end,
}
