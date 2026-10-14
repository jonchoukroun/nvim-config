-- Install managed by homebrew
---@type vim.lsp.Config
return {
    cmd = { "jdtls" },
    filetypes = { "java" },
    root_markers = { ".git", "settings.gradle" },
    settings = {
        java = {
            format = {
                enabled = false,
            },
        },
    },
}

-- TODO: prevent diagnostics matching on TODOs
