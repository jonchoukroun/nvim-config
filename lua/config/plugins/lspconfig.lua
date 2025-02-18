return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"emmet_ls",
					"lua_ls",
					"rust_analyzer",
					"ts_ls",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"eslint",
					"prettierd",
					"stylelint",
					"stylua",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Diagnostics
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { desc = "", buffer = ev.buf }

					opts.desc = "Go to definition"
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

					opts.desc = "Go to declaration"
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

					opts.desc = "Go to implementation"
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

					opts.desc = ""
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					opts.desc = "Rename"
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				end,
			})

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local servers = {
				clangd = {},
				sourcekit = {
					root_dir = lspconfig.util.root_pattern(".git", "Package.swift", "compile_commands.json"),
				},
				emmet_ls = {},
				lua_ls = {
					settings = { Lua = {} },
				},
				ts_ls = {},
			}
			for server, setup in pairs(servers) do
				setup.capabilities = capabilities
				lspconfig[server].setup(setup)
			end
		end,
	},
}
