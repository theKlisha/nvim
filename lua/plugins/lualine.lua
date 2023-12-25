return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-lua/lsp-status.nvim" },
	event = "VimEnter",
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "│", right = "│" },
			section_separators = { left = "▒", right = "▒" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = { "filetype", "require('lsp-status').status()" },
			lualine_z = { "progress", "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
	},
}
