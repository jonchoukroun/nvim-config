local M = {}

---@param lang string
function M.start(lang)
    local buf = vim.api.nvim_get_current_buf()
    require("nvim-treesitter").install({ lang }):await(function(err, ok)
        if err or not ok then
            return
        end
        vim.schedule(function()
            if vim.api.nvim_buf_is_valid(buf) then
                vim.treesitter.start(buf, lang)
            end
        end)
    end)
end

return M
