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
			"<leader>ft",
			"<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), true)<CR>",
			{ desc = "Traverse file tree (cwd)" }
		)
		vim.keymap.set(
			"n",
			"<leader>fT",
			"<cmd>lua MiniFiles.open(vim.loop.cwd(), true)<CR>",
			{ desc = "Traverse file tree (root)" }
		)
	end,
}
