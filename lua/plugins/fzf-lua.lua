return {
	"ibhagwan/fzf-lua",
	config = function()
		local fzfLua = require("fzf-lua")
		fzfLua.setup({
            "telescope",
			winopts = { preview = { wrap = true } },
			fzf_opts = { ["--cycle"] = true },
			files = {
				git_icons = false,
				file_icons = false,
				color_icons = false,
			},
		})

        -- Buffer/file management
        vim.keymap.set("n", "<leader>bb", fzfLua.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>ff", fzfLua.files, { desc = "Find files (cwd)" })
		vim.keymap.set("n", "<leader>fF", fzfLua.git_files, { desc = "Find files (root)" })
		vim.keymap.set("n", "<leader>fr", fzfLua.oldfiles, { desc = "Recent files" })

        -- Search
		vim.keymap.set("n", "<leader>sg", fzfLua.live_grep, { desc = "Search (live grep w/ glob)" })
		vim.keymap.set("n", "<leader>sw", fzfLua.grep_cword, { desc = "Search word" })
		vim.keymap.set("n", "<leader>sW", fzfLua.grep_cWORD, { desc = "Search word (exact)" })
		vim.keymap.set("v", "<leader>sw", fzfLua.grep_visual, { desc = "Search selection" })
		vim.keymap.set("n", "<leader>sr", function()
			fzfLua.live_grep({ resume = true })
		end, { desc = "Resume search" })

        -- LSP Functionality
		vim.keymap.set("n", "<leader>lr", fzfLua.lsp_references, { desc = "LSP references" })
		vim.keymap.set("n", "<leader>ld", fzfLua.lsp_definitions, { desc = "LSP definitions" })
		vim.keymap.set("n", "<leader>lD", fzfLua.lsp_declarations, { desc = "LSP declarations (no TS support)" })
		vim.keymap.set("n", "<leader>ly", fzfLua.lsp_typedefs, { desc = "Type definitions" })
		vim.keymap.set("n", "<leader>li", fzfLua.lsp_implementations, { desc = "LSP implementations" })
		vim.keymap.set("n", "<leader>lc", fzfLua.lsp_code_actions, { desc = "LSP code actions" })

        -- Git, docs, etc
		vim.keymap.set("n", "<leader>fc", fzfLua.git_bcommits, { desc = "Show git commit log" })
		vim.keymap.set("n", "<leader>fm", fzfLua.manpages, { desc = "Find man pages" })
		vim.keymap.set("n", "<leader>lt", fzfLua.treesitter, { desc = "List treesitter symbols" })

        -- TODO: evaludate usage
		vim.keymap.set("n", "<leader>fa", fzfLua.args, { desc = "Show argument list" })
		vim.keymap.set("n", "<leader>ft", fzfLua.tags, { desc = "Find project tags" })
		vim.keymap.set("n", "<leader>fv", fzfLua.commands, { desc = "Find commands" })
	end,
}
