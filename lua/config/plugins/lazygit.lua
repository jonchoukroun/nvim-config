return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "Lazy Git" },
	},
	config = function()
		vim.api.nvim_set_hl(0, "LazyGitFloat", { link = "AccentText", default = true })
	end,
}
