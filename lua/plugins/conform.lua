return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			css = { "prettier" },
			cpp = { "clang-format" },
			html = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
		},
		formatters = {
			prettier = {
				command = "./node_modules/.bin/prettier",
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = false,
		},
	},
}
