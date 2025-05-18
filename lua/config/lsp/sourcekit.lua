vim.lsp.config.sourcekit = {
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift", "objc", "objcpp", "c", "cpp" },
	root_markers = { ".git", "*.xcodeproj" },
}
vim.lsp.enable("sourcekit")
