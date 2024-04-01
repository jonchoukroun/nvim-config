local colors = {
	darkblack = "#000000",
	darkblue = "#003078",
	darkgreen = "#308800",
	darkcyan = "#00a8a8",
	darkred = "#a80000",
	darkmagenta = "#a800a8",
	darkyellow = "#a85700",
	darkwhite = "#a8a8a8",
	darkscroll = "#004078",
	lightblack = "#575757",
	lightblue = "#5757ff",
	lightgreen = "#57ff57",
	lightcyan = "#57ffff",
	lightred = "#ff5757",
	lightmagenta = "#ff57ff",
	lightyellow = "#ffff57",
	lightwhite = "#ffffff",
	lightscroll = "#006078",
}

local z_color = { bg = colors.darkscroll, fg = colors.lightmagenta }
local borland_theme = {
	normal = {
		a = { bg = colors.darkwhite, gui = "bold" },
		b = { bg = colors.darkgreen, fg = colors.lightcyan },
		c = { bg = colors.darkscroll, fg = colors.darkwhite },
		x = { bg = colors.darkgreen, fg = colors.darkblack },
		y = { bg = colors.darkblack, fg = colors.lightblue },
		z = { bg = colors.darkscroll, fg = colors.lightmagenta },
	},
	insert = {
		a = { bg = colors.darkblue, fg = colors.lightyellow, gui = "bold" },
		z = z_color,
	},
	visual = {
		a = { bg = colors.lightcyan, fg = colors.darkblack, gui = "bold" },
		z = z_color,
	},
	replace = {
		a = { bg = colors.darkred, fg = colors.lightwhite, gui = "bold" },
		z = z_color,
	},
	command = {
		a = { bg = colors.darkmagenta, gui = "bold" },
		z = z_color,
	},
	inactive = {
		a = { bg = colors.darkscroll, fg = colors.lightscroll, gui = "bold" },
		z = z_color,
	},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = borland_theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_y = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
			},
		})
	end,
}
