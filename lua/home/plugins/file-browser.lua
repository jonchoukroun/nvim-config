return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        {
            "<leader>fb",
            function()
                require("telescope").extensions.file_browser.file_browser()
            end,
            desc = "File browser",
            noremap = true
        },
        {
            "<leader>fB",
            function()
                require("telescope").extensions.file_browser.file_browser({
                    path = "%:p:h",
                    select_buffer = true,
                })
            end,
            desc = "File browser (buffer path)",
            noremap = true
        },
    }
}
