return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local trouble = require("trouble")

		vim.keymap.set("n", "<leader>xx", function()
			trouble.toggle()
		end, { desc = "Toggle Trouble" })
		vim.keymap.set("n", "<leader>xw", function()
			trouble.toggle("workspace_diagnostics")
		end, { desc = "Toggle Trouble (Workspace)" })
		vim.keymap.set("n", "<leader>xf", function()
			trouble.toggle("document_diagnostics")
		end, { desc = "Toggle Trouble (Document)" })
		vim.keymap.set("n", "gR", function()
			trouble.toggle("lsp_references")
		end)
	end,
}
