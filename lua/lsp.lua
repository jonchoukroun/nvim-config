vim.lsp.enable({
	"clangd",
	"emmet-language-server",
	"lua-language-server",
	-- "stylua",
	"typescript-language-server",
})
vim.diagnostic.config({ virtual_lines = { current_line = true } })
