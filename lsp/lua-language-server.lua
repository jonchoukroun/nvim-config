---@type vim.lsp.Config
return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { '.git' },
    settings = {
        Lua = {
            codeLens = {
                enable = true,
            },
            completion = {
                enable = true,
            },
            diagnostics = {
                globals = { "vim" },
            },
            hint = {
                enable = true,
            },
            runtime = {
                version = "LuaJIT"
            },
            telemtry = {
                enable = false,
            },
            workspace = {
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
            },
        },
    },
}
