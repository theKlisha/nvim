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
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{
		"johmsalas/text-case.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("textcase").setup({})
			require("telescope").load_extension("textcase")
		end,
		keys = {
			"<leader>c", -- Default invocation prefix
			{ "<leader>c",  "<cmd>TextCaseOpenTelescope<CR>",                                    mode = { "n", "x" }, desc = "Change case" },
			{ "<leader>cs", '<cmd>lua require("textcase").current_word("to_snake_case")<cr>',    mode = { "n", "x" }, desc = "Change to snake case" },
			{ "<leader>cC", '<cmd>lua require("textcase").current_word("to_constant_case")<cr>', mode = { "n", "x" }, desc = "Change to constant case" },
			{ "<leader>cc", '<cmd>lua require("textcase").current_word("to_camel_case")<cr>',    mode = { "n", "x" }, desc = "Change to camel case" },
			{ "<leader>cp", '<cmd>lua require("textcase").current_word("to_pascal_case")<cr>',   mode = { "n", "x" }, desc = "Change to pascal case" },
		},
		cmd = {
			-- NOTE: The Subs command name can be customized via the option "substitude_command_name"
			"Subs",
			"TextCaseOpenTelescope",
			"TextCaseOpenTelescopeQuickChange",
			"TextCaseOpenTelescopeLSPChange",
			"TextCaseStartReplacingCommand",
		},
		-- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
		-- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
		-- available after the first executing of it or after a keymap of text-case.nvim has been used.
		lazy = false,
	},
}
