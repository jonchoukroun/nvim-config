return {
	"datsfilipe/vesper.nvim",
	version = false,
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme vesper]])
	end,
}
