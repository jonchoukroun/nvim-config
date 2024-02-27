return {
    "letorbi/vim-colors-modern-borland",

    -- "catppuccin/nvim",
    -- name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true
        vim.cmd([[colorscheme borland]])

        -- vim.cmd([[colorscheme catppuccin]])
    end,
}
