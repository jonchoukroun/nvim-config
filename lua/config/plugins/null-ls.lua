return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            debug = true,
            sources = {
                -- Linting
                null_ls.builtins.diagnostics.eslint_d.with({
                    cwd = require("null-ls.helpers").cache.by_bufnr(function(params)
                        return require("null-ls.utils").root_pattern(".eslintrc.js")
                    end),
                }),
                -- Completion is handled by nvim-cmp
                -- Formatting
                null_ls.builtins.formatting.htmlbeautifier,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.stylua,
                -- Code Actions
                null_ls.builtins.code_actions.eslint_d,
            },

            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })
    end,
}
