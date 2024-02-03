return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            version = "^1.0.0",
        },
    },
    config = function()
        local telescope = require("telescope")

        telescope.load_extension("live_grep_args")

        telescope.setup({
            extensions = {
                live_grep_args = { auto_quoting = true },
            },
        })

        local builtin = require("telescope.builtin")
        local lga_shortcuts = require("telescope-live-grep-args.shortcuts")

        vim.keymap.set("n", "<leader>fc", builtin.git_bcommits, { desc = "Show git commits" })
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (cwd)" })
        vim.keymap.set("n", "<leader>fF", builtin.git_files, { desc = "Find files (root)" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
        vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Find man pages" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
        vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Find buffers" })
        vim.keymap.set("n", "<leader>fv", builtin.commands, { desc = "Find commands" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume search" })
        vim.keymap.set("n", "<leader>sw", function()
            lga_shortcuts.grep_word_under_cursor({ postfix = "" })
        end, { desc = "Find word (grep)" })
    end,
}
