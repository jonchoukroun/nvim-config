return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
        "JoosepAlviste/nvim-ts-context-commentstring",
        "nvim-treesitter/nvim-treesitter-context",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-ts-autotag").setup()

        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "objc",
                "rust",
                "swift",
                "typescript",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        })

        require("ts_context_commentstring").setup({})

        require("treesitter-context").setup({
            multiline_threshold = 4,
            separator = "_",
        })
    end,
}
