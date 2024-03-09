return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup()
		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Find buffers" })

		vim.keymap.set("n", "<leader>fc", builtin.git_bcommits, { desc = "Show git commits" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (cwd)" })
		vim.keymap.set("n", "<leader>fF", builtin.git_files, { desc = "Find files (root)" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
		vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Find man pages" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
		vim.keymap.set("n", "<leader>fv", builtin.commands, { desc = "Find commands" })

		vim.keymap.set("n", "<leader>lt", builtin.treesitter, { desc = "List treesitter symbols" })

		vim.keymap.set("n", "<leader>sg", function()
			builtin.grep_string({ search = vim.fn.input("Grep >") })
		end, { desc = "Search (grep)" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume search" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search word" })
		vim.keymap.set("v", "<leader>sw", builtin.grep_string, { desc = "Search word" })
	end,
}
