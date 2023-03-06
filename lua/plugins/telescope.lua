return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	version = false,
	cmd = "Telescope",
	opts = {
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			mappings = {
				i = {
					["<C-t>"] = function(...)
						return require("trouble.providers.telescope").open_with_trouble(...)
					end,
					["<S-Down>"] = function(...)
						return require("telescope.actions").cycle_history_next(...)
					end,
					["<S-Up>"] = function(...)
						return require("telescope.actions").cycle_history_prev(...)
					end,
					["<Esc>"] = function(...)
						return require("telescope.actions").close(...)
					end,
				},
				n = {
					["q"] = function(...)
						return require("telescope.actions").close(...)
					end,
				},
			},
		},
	},
}
