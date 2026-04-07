-- Linting relies on project binaries. There are no neovim or global linter installs
return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
        y = 10
		vim.env.ESLINT_D_PPID = vim.fn.getpid()
		lint.linters_by_ft = {
			css = { "stylelint" },
			javascript = { "stylelint", "eslint" },
			javascriptreact = { "stylelint", "eslint" },
			scss = { "stylelint" },
			typescript = { "stylelint", "eslint" },
			typescriptreact = { "stylelint", "eslint" },
		}

		lint.linters.luacheck.args = {
			"--globals",
			"vim",
		}

		-- Will not lint on file open
		vim.api.nvim_create_autocmd({ "InsertLeave", "BufReadPost", "BufWritePost" }, {
			callback = function()
				local get_clients = vim.lsp.get_clients
				local client = get_clients({ bufnr = 0 })[1] or {}
				lint.try_lint(nil, { cwd = client.root_dir })
			end,
		})
	end,
}
