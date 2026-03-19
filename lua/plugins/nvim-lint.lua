return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			-- lua = { "luacheck" },
			css = { "stylelint" },
			scss = { "stylelint" },
			javascript = { "stylelint", "eslint_d" },
			typescript = { "stylelint", "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}

		lint.linters.luacheck.args = {
			"--globals",
			"vim",
		}

		vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
