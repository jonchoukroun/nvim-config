return {
	"echasnovski/mini.files",
	version = false,
	config = function()
		require("mini.files").setup({
			mappings = {
				go_in_plus = "<CR>",
			},
		})
		vim.keymap.set(
			"n",
			"-",
			"<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), true)<CR>",
			{ desc = "Open file explorer (cwd)" }
		)
		vim.keymap.set(
			"n",
			"<leader>fe",
			"<cmd>lua MiniFiles.open(vim.loop.cwd(), true)<CR>",
			{ desc = "Open file explorer (root)" }
		)
	end,
}
