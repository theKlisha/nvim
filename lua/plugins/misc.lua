return {
	{
		"echasnovski/mini.bufremove",
		config = function(_, opts)
			require("mini.bufremove").setup(opts)
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Trouble",
		config = function(_, opts)
			require("trouble").setup(opts)
		end,
	},
	{
		"tpope/vim-sleuth",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		event = "InsertEnter",
	},
}
