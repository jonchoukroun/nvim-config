return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			stages = "no_animation",
			render = "compact",
			top_down = false,
			merge_duplicates = 2,
		})
	end,
}
