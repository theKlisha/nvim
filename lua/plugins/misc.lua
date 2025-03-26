return {
	{
		"echasnovski/mini.bufremove",
		config = function(_, opts)
			require("mini.bufremove").setup(opts)
		end,
	},
	{
		"echasnovski/mini.cursorword",
		opts = { delay = 0 },
		config = function(_, opts)
			require("mini.cursorword").setup(opts)
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
