return {
	"simrat39/rust-tools.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	ft = "rust",
	opts = function()
		local capabilities = require("rust-tools").capabilities
	end,
	config = function(_, opts)
		require("rust-tools").setup(opts)
	end,
}
