local conform = {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            c = { "clang-format" },
            css = { "prettier" },
            cpp = { "clang-format" },
            html = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            json = { "prettier" },
            lua = { "stylua" },
            markdown = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
        },
        formatters = {
            prettier = {
                command = "./node_modules/.bin/prettier",
            },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = false,
        },
    },
}

vim.api.nvim_create_user_command("FormatCodebase", function()
    -- Find trackable source files using git if available, or fallback to fd/find
    local handle = io.popen("git ls-files 2>/blank")
    local files = {}

    if handle then
        for file in handle:lines() do
            table.insert(files, file)
        end
        handle:close()
    end

    -- If not a git repo, find all files manually (excluding node_modules and .git)
    if #files == 0 then
        local scan = io.popen('find . -type f -not -path "*/.*" -not -path "*/node_modules/*"')
        if scan then
            for file in scan:lines() do
                table.insert(files, file)
            end
            scan:close()
        end
    end

    -- Loop through files, load them into a buffer, and apply conform formatting
    local conform = require("conform")
    local total = #files
    print("Formatting " .. total .. " files...")

    for i, filepath in ipairs(files) do
        local bufnr = vim.fn.bufadd(filepath)
        vim.fn.bufload(bufnr)

        conform.format({
            bufnr = bufnr,
            async = false, -- Needs to be synchronous to avoid race conditions across files
        }, function(err)
            if not err then
                -- Force write changes to disk if the buffer was modified
                if vim.api.nvim_get_option_value("modified", { buf = bufnr }) then
                    vim.api.nvim_buf_call(bufnr, function()
                        vim.cmd("silent! write")
                    end)
                end
            end
        end)
    end

    print("Codebase formatting complete!")
end, {})

return conform
