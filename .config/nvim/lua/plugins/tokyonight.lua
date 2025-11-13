return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				transparent_background = false,
			})
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}
