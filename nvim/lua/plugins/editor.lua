return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = "main",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
	},
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
}
