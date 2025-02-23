return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		delay = 0,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},

		{
			"<leader>w",
			"<c-w>",
			desc = "Enter window mode",
		},
		{
			"<leader>=",
			function()
				vim.lsp.buf.format({ asyc = true })
			end,
			desc = "Format buffer (LSP)",
		},
		{
			"<leader>'",
			function()
				local opts = require("telescope.themes").get_dropdown({ shorten_path = true })
				require("telescope.builtin").buffers(opts)
			end,
			desc = "Open last fuzzy picker",
		},
		{
			"<leader>f",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Open file picker",
		},
		{
			"<leader>b",
			function()
				local opts = require("telescope.themes").get_dropdown({ shorten_path = true })
				require("telescope.builtin").buffers(opts)
			end,
			desc = "Open buffer picker",
		},
		{
			"<leader>/",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Global search in workspace directory",
		},
		{
			"<leader>E",
			"<cmd>Neotree source=filesystem position=float dir=./ reveal_force_cwd<cr>",
			desc = "Open file tree",
		},
		{
			"<leader>e",
			function()
				require("mini.files").open()
			end,
			desc = "Delete Buffer (Force)",
		},
		{
			"mq",
			function()
				require("mini.bufremove").delete(0, false)
			end,
			desc = "Delete Buffer",
		},
		{
			"mQ",
			function()
				require("mini.bufremove").delete(0, true)
			end,
			desc = "Delete Buffer (Force)",
		},

		-- GoTo mode
		{ "gd", "<cmd>Trouble lsp_definitions<CR>", desc = "LSP Definitions" },
		{ "gr", "<cmd>Trouble lsp_references<CR>",  desc = "Go to references (LSP)" },

		-- Source control mode
		{
			"ss",
			function()
				vim.fn.system("tmux new-window lazygit")
			end,
			desc = "Open lazygit",
		},
		{ "sa", require("gitsigns").stage_hunk,                             desc = "Git stage hunk" },
		{ "sA", require("gitsigns").stage_buffer,                           desc = "Git stage buffer" },
		{ "sr", require("gitsigns").reset_hunk,                             desc = "Git reset hunk" },
		{ "sR", require("gitsigns").reset_buffer,                           desc = "Git reset buffer" },
		{ "sb", require("gitsigns").blame_line,                             desc = "Blame line (Git)" },
		{ "se", "<cmd>Neotree source=git_status position=float dir=./<cr>", desc = "Open git status file tree" },
	},
}
