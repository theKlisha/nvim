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
				require("telescope.builtin").resume()
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
			"<leader>s",
			function()
				require("telescope.builtin").document_symbols()
			end,
			desc = "Find document symbols",
		},
		{
			"<leader>s",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols()
			end,
			desc = "Find workspace symbols",
		},
		{
			"<leader>/",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Global search in workspace directory",
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
		{ "gr", vim.lsp.buf.definition, "Go to definition" },
		{ "gD", "<cmd>Trouble lsp_definitions<CR>", desc = "Go to definitions with Trouble" },
		{ "gr", vim.lsp.buf.references, "Go to references" },
		{ "gR", "<cmd>Trouble lsp_references<CR>",  desc = "Go to references with Trouble" },

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
	},
}
