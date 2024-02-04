return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
        vim.g.lualine_laststatus = vim.o.statusline
        if vim.fn.argc(-1) > 0 then
            vim.o.statusline = " "
        else
            vim.o.statusline = 0
        end
    end,
    opts = {
        icons_enabled = true,
        -- theme = "gruvbox",
        theme = "catppuccin",
    },
    config = function()
        require("lualine").setup()
    end,
}
