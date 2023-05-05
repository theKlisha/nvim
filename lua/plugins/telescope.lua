return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	version = false,
	cmd = "Telescope",
	opts = function()
		local actions = require("telescope.actions")

		return {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-J>"] = actions.cycle_history_next,
						["<C-K>"] = actions.cycle_history_prev,
						["<C-v>"] = actions.file_vsplit,
						["<C-c>"] = actions.close,
					},
					n = {
						["t"] = require("trouble.providers.telescope").open_with_trouble,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["J"] = actions.cycle_history_next,
						["K"] = actions.cycle_history_prev,
						["v"] = actions.file_vsplit,
						["<C-c>"] = actions.close,
					},
				},
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<C-x>"] = actions.delete_buffer,
						},
                        n = {
                            ["x"] = actions.delete_buffer,
                        },
					},
				},
			},
		},
	},
}
