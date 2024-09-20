return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		filter = function(mapping)
			return mapping.desc and mapping.desc ~= ""
		end,
		replace = {
			key = {
				{ "<tab>", "TAB" },
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer local keymaps",
		},
	},
}
