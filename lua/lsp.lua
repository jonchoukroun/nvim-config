-- LSP installed on machine, not using Mason
vim.lsp.enable({
	"clangd",
	"emmet-language-server",
	"lua-language-server",
	"typescript-language-server",
})
vim.diagnostic.config({ virtual_lines = { current_line = true } })
