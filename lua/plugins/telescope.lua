local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			prompt_position = "top",
			-- height = vim.o.lines -10, -- maximally available lines
			-- width = vim.o.columns -10, -- maximally available columns
			-- preview_height = 0.8, -- 60% of available lines
		},
		prompt_prefix = " ",
		selection_caret = " ",
		mappings = {
			i = {
				["<C-t>"] = require("trouble.sources.telescope").open,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-J>"] = actions.cycle_history_next,
				["<C-K>"] = actions.cycle_history_prev,
				["<C-v>"] = actions.file_vsplit,
				["<C-c>"] = actions.close,
			},
			n = {
				["t"] = require("trouble.sources.telescope").open,
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
	extensions = {
		repo = {
			list = {
				fd_opts = {
					"--no-ignore-vcs",
				},
				search_dirs = {
					"~/repos/",
				},
			},
		},
	},
})
