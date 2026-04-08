return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	config = function()
		require("nvim-treesitter-textobjects").setup()
		local select = require("nvim-treesitter-textobjects.select")

		-- Functions
		vim.keymap.set({ "x", "o" }, "am", function()
			select.select_textobject("@function.outer", "textobjects")
		end, { desc = "Select outer function" })
		vim.keymap.set({ "x", "o" }, "im", function()
			select.select_textobject("@function.inner", "textobjects")
		end, { desc = "Select inner function" })

		-- Classes
		vim.keymap.set({ "x", "o" }, "ac", function()
			select.select_textobject("@class.outer", "textobjects")
		end, { desc = "Select outer class" })
		vim.keymap.set({ "x", "o" }, "ic", function()
			select.select_textobject("@class.inner", "textobjects")
		end, { desc = "Select inner class" })

		-- Parameters
		vim.keymap.set({ "x", "o" }, "aa", function()
			select.select_textobject("@parameter.outer", "textobjects")
		end, { desc = "Select outer parameter" })
		vim.keymap.set({ "x", "o" }, "ia", function()
			select.select_textobject("@parameter.inner", "textobjects")
		end, { desc = "Select inner parameter" })

		-- Function navigation
		local move = require("nvim-treesitter-textobjects.move")

		vim.keymap.set({ "n", "x", "o" }, "]m", function()
			move.goto_next_start("@function.outer", "textobjects")
		end, { desc = "Next function start" })
		vim.keymap.set({ "n", "x", "o" }, "[m", function()
			move.goto_previous_start("@function.outer", "textobjects")
		end, { desc = "Previous function start" })
		vim.keymap.set({ "n", "x", "o" }, "]M", function()
			move.goto_next_end("@function.outer", "textobjects")
		end, { desc = "Next function end" })
		vim.keymap.set({ "n", "x", "o" }, "[M", function()
			move.goto_previous_end("@function.outer", "textobjects")
		end, { desc = "Previous function end" })

		-- Class navigation
		vim.keymap.set({ "n", "x", "o" }, "]c", function()
			move.goto_next_start("@class.outer", "textobjects")
		end, { desc = "Next class start" })
		vim.keymap.set({ "n", "x", "o" }, "[c", function()
			move.goto_previous_start("@class.outer", "textobjects")
		end, { desc = "Previous class start" })
		vim.keymap.set({ "n", "x", "o" }, "]C", function()
			move.goto_next_end("@class.outer", "textobjects")
		end, { desc = "Next class end" })
		vim.keymap.set({ "n", "x", "o" }, "[C", function()
			move.goto_previous_end("@class.outer", "textobjects")
		end, { desc = "Previous class end" })

		-- Scope navigation
		vim.keymap.set({ "n", "x", "o" }, "]s", function()
			move.goto_next_start("@local.scope", "locals")
		end, { desc = "Next scope start" })
		vim.keymap.set({ "n", "x", "o" }, "[s", function()
			move.goto_previous_start("@local.scope", "locals")
		end, { desc = "Previous scope start" })
		vim.keymap.set({ "n", "x", "o" }, "]S", function()
			move.goto_next_end("@local.scope", "locals")
		end, { desc = "Next scope end" })
		vim.keymap.set({ "n", "x", "o" }, "[S", function()
			move.goto_previous_end("@local.scope", "locals")
		end, { desc = "Previous scope end" })
	end,
}
