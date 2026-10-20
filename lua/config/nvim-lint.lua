-- Web tool-based linting depends on project binaries, but C/C++ static analysis
-- is globally installed
local lint = require("lint")
vim.env.ESLINT_D_PPID = vim.fn.getpid()
lint.linters_by_ft = {
    c = { "cppcheck" },
    cpp = { "cppcheck" },
    css = { "stylelint" },
    javascript = { "stylelint", "eslint" },
    javascriptreact = { "stylelint", "eslint" },
    scss = { "stylelint" },
    typescript = { "stylelint", "eslint" },
    typescriptreact = { "stylelint", "eslint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufReadPost", "BufWritePost" }, {
    callback = function()
        local get_clients = vim.lsp.get_clients
        local client = get_clients({ bufnr = 0 })[1] or {}
        lint.try_lint(nil, { cwd = client.root_dir })
    end,
})
