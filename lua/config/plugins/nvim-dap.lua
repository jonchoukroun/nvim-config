return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	event = "VeryLazy",
	opts = {
		handlers = {},
		ensure_installed = { "codelldb" },
	},
	keys = {
		{ "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
		{ "<leader>dr", "<cmd>DapContinue<CR>", desc = "Run Debugger" },
		{ "<leader>ds", "<cmd>DapTerminate<CR>", desc = "Stop Debugger" },
	},
}
