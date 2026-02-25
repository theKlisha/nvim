require("which-key").setup({
	preset = "helix",
	delay = 0,
})

require("which-key").add({
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
	{ "gd", vim.lsp.buf.definition,     desc = "Go to definition" },
	{ "gi", vim.lsp.buf.implementation, desc = "Go to implementation" },
	{ "gr", vim.lsp.buf.references,     desc = "Go to references" },
	-- {
	-- 	"gD",
	-- 	function()
	-- 		require("trouble").open({ mode = "lsp_definitions" })
	-- 	end,
	-- 	desc = "Go to definitions with Trouble",
	-- },
	-- {
	-- 	"gR",
	-- 	function()
	-- 		require("trouble").open({ mode = "lsp_references" })
	-- 	end,
	-- 	desc = "Go to references with Trouble",
	-- },

	-- Source control mode
	{
		"ss",
		function()
			vim.fn.system("tmux new-window lazygit")
		end,
		desc = "Open lazygit",
	},
	{ "sa", require("gitsigns").stage_hunk,   desc = "Git stage hunk" },
	{ "sA", require("gitsigns").stage_buffer, desc = "Git stage buffer" },
	{ "sr", require("gitsigns").reset_hunk,   desc = "Git reset hunk" },
	{ "sR", require("gitsigns").reset_buffer, desc = "Git reset buffer" },
	{ "sb", require("gitsigns").blame_line,   desc = "Blame line (Git)" },
})
