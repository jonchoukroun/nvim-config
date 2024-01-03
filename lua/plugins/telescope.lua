return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
        { 
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            version = "^1.0.0",
        },
    },
    config = function()
        local telescope = require("telescope")
        local lga_actions = require("telescope-live-grep-args.actions")
        telescope.load_extension("live_grep_args")

        telescope.setup({
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " })
                        }
                    }
                }
            }
        })

        local builtin = require('telescope.builtin')
        local lga_shortcuts = require("telescope-live-grep-args.shortcuts")

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find files (git)" })
        vim.keymap.set("n", "<leader>fw", lga_shortcuts.grep_word_under_cursor, { desc = "Find word (grep)" })
        vim.keymap.set('n', "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set('n', "<leader>fb", builtin.buffers, { desc = "Find buffers" })
        vim.keymap.set('n', "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
        vim.keymap.set('n', "<leader>fm", builtin.marks, { desc = "Find marks" })

        vim.keymap.set("n", "<leader>fc", builtin.git_bcommits, { desc = "Show git commits" })

        vim.keymap.set('n', "<leader>ft", builtin.treesitter, { desc = "Find treesitter" })
    end
}

