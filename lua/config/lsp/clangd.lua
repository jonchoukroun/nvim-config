vim.lsp.config.clangd = {
	cmd = {
		"clangd",
		"--background-index",
		"--inlay-hints",
	},
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = {
		"compile_commands.json",
		".git",
		"*.xcodeproj",
	},
}
vim.lsp.enable("clangd")
