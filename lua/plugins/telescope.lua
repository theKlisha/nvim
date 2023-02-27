return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	version = false,
	cmd = "Telescope",
    keys = function()
		local telescope = function(name, opts)
			return function()
				require("telescope.builtin")[name](opts)
			end
		end

		return {
			{ "<leader>F", telescope("resume"), desc = "Resume telescope" },
			{ "<leader>fb", telescope("buffers"), desc = "Find buffers" },
			{ "<leader>ff", telescope("find_files"), desc = "Find Files" },
			{ "<leader>ft", telescope("live_grep"), desc = "Grep" },
			{ "<leader>fr", telescope("oldfiles"), desc = "Find Recent files" },
			{ "<leader>fh", telescope("help_tags"), desc = "Find help pages" },
			{ "<leader>fc", telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
			{
				"<leader>fs",
				telescope("lsp_document_symbols", {
					symbols = {
						"Class",
						"Function",
						"Method",
						"Constructor",
						"Interface",
						"Module",
						"Struct",
						"Trait",
						"Field",
						"Property",
					},
				}),
				desc = "Goto Symbol",
			},
		}
	end,
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
