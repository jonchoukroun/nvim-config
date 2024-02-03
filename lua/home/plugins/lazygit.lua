return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "Lazy Git" },
	},
	config = function()
		require("telescope").load_extension("lazygit")
	end,
}
