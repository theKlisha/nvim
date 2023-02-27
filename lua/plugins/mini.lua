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
		keys = {
			{
				"<leader>q",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>Q",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete Buffer (Force)",
			},
		},
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
				comment = "<leader>/",

				-- Toggle comment on current line
				comment_line = "<leader>/",

				-- Define 'comment' textobject (like `dgc` - delete whole comment block)
				-- textobject = "<leader>/",
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
}
