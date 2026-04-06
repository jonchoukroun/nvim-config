---@type vim.lsp.Config
return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact"
    },
    root_markers = {
        ".git",
        ".tsconfig",
        "tsconfig.json",
        "tsconfig.base.json"
    }
}
