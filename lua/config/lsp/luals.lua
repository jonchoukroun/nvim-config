vim.lsp.config["luals"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".git", vim.uv.cwd() },
	settings = {
		Lua = {
			telemetry = {
				enable = false,
			},
		},
	},
}

vim.lsp.enable("luals")
