local delete_buffer = function()
	require("mini.bufremove").delete(0, false)
end

local delete_buffer_force = function()
	require("mini.bufremove").delete(0, true)
end

local blame_line = function()
	require("gitsigns.actions").blame_line({ full = true })
end

local format = function()
	vim.lsp.buf.format({ async = true })
end

local telescope = function(name, opts)
	return function()
		require("telescope.builtin")[name](opts)
	end
end

return {
	"mrjones2014/legendary.nvim",
	tag = "v2.1.0",
	event = "VimEnter",
	opts = {
		keymaps = {
			{ "<leader><leader>", "<cmd>Legendary<cr>", description = "open legendary" },
			{ "<leader>a", "<cmd>Alpha<cr>", description = "open home screen" },
			{ "<leader>ll", require("lazy").show, description = "open plugin manager" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", description = "find files" },
			{
				"<c-\\>",
				"<cmd>OolongToggleShell<cr>",
				description = "Toggle terminal",
				mode = { "n", "t" },
			},

			-- Find
			{ "<leader>F", telescope("resume"), description = "Resume telescope" },
			{ "<leader>fb", telescope("buffers"), description = "Find buffers" },
			{ "<leader>ff", telescope("find_files"), description = "Find Files" },
			{ "<leader>ft", telescope("live_grep"), description = "Grep" },
			{ "<leader>fr", telescope("oldfiles"), description = "Find Recent files" },
			{ "<leader>fh", telescope("help_tags"), description = "Find help pages" },
			{ "<leader>fc", telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
			--

			-- Buffers
			{ "<leader>]", "<cmd>BufferLineCycleNext<CR>", description = "Next buffer" },
			{ "<leader>[", "<cmd>BufferLineCyclePrev<CR>", description = "Previous buffer" },
			{ "<leader>}", "<cmd>BufferLineMoveNext<CR>", description = "Move buffer to right" },
			{ "<leader>{", "<cmd>BufferLineMovePrev<CR>", description = "Move buffer to left" },
			{ "<leader>bs", "<cmd>BufferLineSortByRelativeDirectory<CR>", description = "Sort buffers" },
			{ "<leader>q", delete_buffer, desc = "Delete Buffer" },
			{ "<leader>Q", delete_buffer_force, desc = "Delete Buffer (Force)" },

			-- Git
			{ "<leader>gg", "<cmd>OolongToggleLazygit<cr>", description = "Toggle lazygit" },
			{ "<leader>gb", blame_line, description = "Git blame line" },
			{ "<leader>gs", require("gitsigns.actions").stage_hunk, description = "Git stage hunk" },
			{ "<leader>gS", require("gitsigns.actions").stage_buffer, description = "Git stage buffer" },
			{ "<leader>gr", require("gitsigns.actions").reset_hunk, description = "Git reset hunk" },
			{ "<leader>gR", require("gitsigns.actions").reset_buffer, description = "Git reset buffer" },

			-- LSP
			{ "<leader>lf", format, description = "LSP Format buffer" },
			{ "K", vim.lsp.buf.hover, description = "LSP Hover" },
			{ "gi", vim.lsp.buf.implementation, description = "LSP Implementation" },
			{ "gl", vim.diagnostic.open_float, description = "LSP Diagnostics" },
			{ "gd", "<cmd>Trouble lsp_definitions<CR>", description = "LSP Definitions" },
			{ "gr", "<cmd>Trouble lsp_references<CR>", description = "LSP References" },
			{ "<leader>la", vim.lsp.buf.code_action },
			{ "<leader>lr", vim.lsp.buf.rename },
			{ "<leader>ls", vim.lsp.buf.signature_help },
			{ "<leader>lq", vim.diagnostic.setloclist },
			{ "<leader>li", "<cmd>LspInfo<cr>", "LSP Info" },
			{ "<leader>lm", "<cmd>Mason<cr>", "Open LSP manager" },
		},
		select_prompt = "",
		include_builtin = false,
	},
}
