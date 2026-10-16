-- Install managed by homebrew
---@type vim.lsp.Config
return {
    cmd = { "jdtls" },
    filetypes = { "java" },
    handlers = {
        ["textDocument/publishDiagnostics"] = function(err, result, ctx)
            result.diagnostics = vim.tbl_filter(function(d)
                return not d.message:match("TODO")
            end, result.diagnostics)
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
        end,
    },
    root_markers = { ".git", "settings.gradle" },
    settings = {
        java = {
            format = {
                enabled = false,
            },
        },
    },
}
