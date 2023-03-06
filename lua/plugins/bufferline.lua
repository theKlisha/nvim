return {
	"akinsho/bufferline.nvim",
	event = "VimEnter",
	cmd = {
		"BufferLineCycleNext",
		"BufferLineCyclePrev",
		"BufferLineMoveNext",
		"BufferLineMovePrev",
		"BufferLineSortByRelativeDirectory",
	},
	opts = {
		options = {
			separator_style = "thin",
			modified_icon = "●",
			left_trunc_marker = "",
			right_trunc_marker = "",
			tab_size = 20,
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
			color_icons = false,
			show_close_icons = false,
			show_buffer_close_icons = false,
			indicator = { icon = "▎" },
		},
	},
}
