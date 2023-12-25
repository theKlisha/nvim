return {
	"nvim-lua/lsp-status.nvim",
	opts = {
		kind_labels = {},
		current_function = true,
		show_filename = true,
		diagnostics = true,
		indicator_separator = " ",
		component_separator = " ",
		indicator_errors = "",
		indicator_warnings = "󰀦",
		indicator_info = "󰋼",
		indicator_hint = "󰌵",
		indicator_ok = "󰆦",
		spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
		status_symbol = "",
		select_symbol = nil,
		update_interval = 100,
	},
	config = function(_, opts)
		require("lsp-status").config(opts)
		require("lsp-status").register_progress()
	end,
}
