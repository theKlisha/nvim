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
	{
		"echasnovski/mini.comment",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			mappings = {
				-- Toggle comment (like `gcip` - comment inner paragraph) for both
				-- Normal and Visual modes
				comment = "?",

				-- Toggle comment on current line
				comment_line = "?",
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
}
