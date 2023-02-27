return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ focus = true, dir = vim.loop.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
			remap = true,
		},
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	init = function()
		vim.g.neo_tree_remove_legacy_commands = 1
		if vim.fn.argc() == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end
	end,
	opts = {
		-- close_if_last_window = true,
		popup_border_style = "rounded",
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = true,
		},
		window = {
			width = 45,
			mappings = {
				["<space>"] = "none",
			},
		},
		default_component_configs = {
			container = {
				enable_character_fade = true,
			},
			indent = {
				indent_size = 2,
				padding = 1,
				-- indent guides
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				-- expander config, needed for nesting files
				with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "ﰊ",
				default = "",
				highlight = "NeoTreeFileIcon",
			},
			modified = {
				symbol = "",
				highlight = "NeoTreeModified",
			},
			name = {
				trailing_slash = false,
				use_git_status_colors = false,
				highlight = "NeoTreeFileName",
			},
			git_status = {
				symbols = {
					-- Change type
					added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = "", -- this can only be used in the git_status source
					renamed = "", -- this can only be used in the git_status source
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
			buffers = {
				follow_current_file = true, -- This will find and focus the file in the active buffer every time the current file is changed while the tree is open.
			},
		},
	},
}
