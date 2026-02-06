return {
	-- catppuccin: colorful pastel
	{
		-- {
		-- 	"catppuccin/nvim",
		-- 	name = "catppuccin",
		-- 	priority = 1000,
		-- 	config = function()
		-- 		vim.cmd("colorscheme catppuccin")
		-- 	end,
		-- },
	},
    -- rose pine: minimal pinkish
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function ()
            vim.cmd("colorscheme rose-pine")
        end
    },
	-- Updated legacy vim colorscheme
	{
		-- dir = "/Users/jonchoukroun/Developer/NvimPlugins/AphexColor/",
		-- name = "aphex",
		-- config = function()
		-- 	require("aphex").setup({
		-- 		-- Start with default settings
		-- 	})
		-- 	vim.cmd("colorscheme aphex")
		-- end,
	},
	-- Phospohorescent blues and greens, orange accents
	{
		-- "jonchoukroun/nvim-phosphor",
		-- name = "phosphor",
		-- config = function()
		-- 	vim.cmd("colorscheme phosphor")
		-- end,
	},
	-- Stormy coastline, easy and pleasant
	{
		-- dir = "/Users/jonchoukroun/Developer/NvimPlugins/SimpleColor/",
		-- name = "retrocode",
		-- config = function()
		-- 	vim.cmd("colorscheme retrocode")
		-- end,
	},
}
