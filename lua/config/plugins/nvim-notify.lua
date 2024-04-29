return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			stages = "static",
			render = "wrapped-compact",
			top_down = false,
		})
	end,
}
