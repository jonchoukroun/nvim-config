return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(buffer)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
            end

            map("n", "]h", gs.next_hunk, "Next hunk")
            map("n", "[h", gs.prev_hunk, "Prev hunk")
            map("n", "<leader>ghr", gs.reset_hunk, "Reset hunk")
            map("n", "<leader>ghR", gs.reset_buffer, "Reset buffer")
            map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame line")
            map("n", "<leader>ghd", gs.diffthis, "Diff this")
        end,
    }
}
