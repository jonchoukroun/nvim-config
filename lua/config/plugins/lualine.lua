local theme = {
	normal = {
		a = "HighlightPrimary",
		b = "PrimaryText",
		c = "HiddenText",
		x = "HiddenText",
		y = "HiddenText",
		z = "HiddenText",
	},
	insert = {
		a = "HighlightAccent",
		z = "HiddenText",
	},
	visual = {
		a = "HighlightCallout",
		z = "HiddenText",
	},
	replace = {
		a = "HighlightError",
		z = "HiddenText",
	},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				theme = theme,
			},
			sections = {
				lualine_b = {
					"branch",
					"diff",
					{
						"diagnostics",
						sources = { "nvim_diagnostic", "nvim_lsp" },
					},
				},
			},
		})
	end,
}
