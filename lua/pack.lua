vim.pack.add({
    -- { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/tpope/vim-surround",
    "https://github.com/OXY2DEV/markview.nvim",
    "https://github.com/windwp/nvim-autopairs",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    "https://github.com/windwp/nvim-ts-autotag",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/folke/trouble.nvim",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/kdheepak/lazygit.nvim",
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/mfussenegger/nvim-lint",
    "https://github.com/ibhagwan/fzf-lua",
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
    { src = "https://github.com/nvim-mini/mini.indentscope", version = "main" },
    "https://github.com/alexghergh/nvim-tmux-navigation",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
})

vim.api.nvim_create_user_command("PackUpdate", function(args)
    vim.pack.update(#args.fargs > 0 and args.fargs or nil)
end, {
    nargs = "*",
    complete = function()
        return vim.tbl_map(function(p)
            return p.spec.name
        end, vim.pack.get())
    end,
    desc = "Update plugins",
})
