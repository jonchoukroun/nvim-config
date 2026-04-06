return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
        vim.env.ESLINT_D_PPID = vim.fn.getpid()
		lint.linters_by_ft = {
			css = { "stylelint" },
			javascript = { "stylelint", "eslint_d" },
			javascriptreact = { "stylelint", "eslint_d" },
            lua = { "luacheck" },
			scss = { "stylelint" },
			typescript = { "stylelint", "eslint_d" },
			typescriptreact = { "stylelint", "eslint_d" },
		}

		lint.linters.luacheck.args = {
			"--globals",
			"vim",
		}

        -- Will not lint on file open
		vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
