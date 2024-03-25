return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter-context",
		{
			"windwp/nvim-ts-autotag",
			config = function()
				require("nvim-treesitter.configs").setup({
					autotag = { enable = true },
				})
			end,
		}
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"bash",
                "c",
				"cpp",
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"objc",
                "regex",
				"rust",
				"tsx",
				"typescript",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})

		require("ts_context_commentstring").setup({})

		require("treesitter-context").setup({
			multiline_threshold = 4,
			separator = "_",
		})
	end,
}
