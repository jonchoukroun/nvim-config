return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require("which-key").setup({
			window = {
				border = "shadow",
				margin = { 0, 5, 2, 5 },
			},
		})
	end,
}
