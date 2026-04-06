return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			css = { "prettierd" },
			cpp = { "clang-format" },
			html = { "prettierd" },
			javascriptreact = { "prettierd" },
			json = { "prettierd" },
			-- lua = { "stylua" },
			markdown = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
		},
		-- format_on_save = {
		-- 	timeout_ms = 500,
		-- 	lsp_format = false,
		-- },
	},
}
