return {
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	{
		"echasnovski/mini.bufremove",
        lazy = true,
		config = function(_, opts)
			require("mini.bufremove").setup(opts)
		end,
	},
}
