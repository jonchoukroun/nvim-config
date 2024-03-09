return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "stylelint", "eslint" },
			typescript = { "stylelint", "eslint" },
			javascriptreact = { "stylelint", "eslint" },
			typescriptreact = { "stylelint", "eslint" },
		}
		vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
