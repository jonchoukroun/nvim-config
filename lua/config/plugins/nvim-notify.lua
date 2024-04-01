return {
	"rcarriga/nvim-notify",
	config = function()
		local on_open = function(win)
			local conf = vim.api.nvim_win_get_config(win)
			conf.height = 2
			conf.border = "shadow"
			vim.api.nvim_win_set_config(win, conf)
		end

		require("notify").setup({
			stages = "static",
			render = "wrapped-compact",
			top_down = false,
			on_open = on_open,
		})
	end,
}
