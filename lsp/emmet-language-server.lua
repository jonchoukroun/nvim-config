-- Install LSP with `npm i -g @olrtg/emmet-language-server`
-- Use mise to ensure correct node versions

---@type vim.lsp.Config
return {
	cmd = { "emmet-language-server", "--stdio" },
	filetypes = { "css", "html", "javascriptreact", "scss", "typescriptreact" },
}
