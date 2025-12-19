local lsp = vim.lsp

local capabilities = lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
	dynamicRegistration = true,
	lineFoldingOnly = true,
}
capabilities.textDocument.semanticTokens.multilineTokenSupport = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

-- Remove default keybindings
for _, bind in ipairs({ "grn", "gra", "gri", "grr" }) do
	pcall(vim.keymap.del, "n", bind)
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local bufnr = ev.buf
		local client = lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end

		if client.server_capabilities.completionProvider then
			vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
		end
		if client.server_capabilities.definitionProvider then
			vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
		end

		-- Set keymaps
		local function setKeymap(mode, keymap, cmd, desc)
			opts = { desc = desc, buffer = ev.buf, silent = true }
			vim.keymap.set(mode, keymap, cmd, opts)
		end

		setKeymap("n", "gd", lsp.buf.definition, "Go to definition")
		setKeymap("n", "gD", lsp.buf.declaration, "Go to declaration")
		setKeymap("n", "gi", function()
			lsp.buf.implementation({ border = "single" })
		end, "Go to implementation")
		setKeymap("n", "gr", lsp.buf.references, "Show references")

		setKeymap("n", "<leader>rn", lsp.buf.rename, "Rename")
		setKeymap("n", "<leader>ca", lsp.buf.code_action, "Code action")
		setKeymap("n", "<leader>ll", lsp.codelens.run, "Run code lens")
	end,
})

require("config.lsp.clangd")
require("config.lsp.luals")
require("config.lsp.sourcekit")
require("config.lsp.typescript")
