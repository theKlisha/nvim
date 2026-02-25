require("which-key").add({
	{ "<leader>e", ":Neotree filesystem reveal<cr>", desc = "Open file tree",       silent = true },
	{ "se",        ":Neotree git_status<cr>", desc = "Open git status tree", silent = true },
})

require("neo-tree").setup(
---@module "neo-tree"
---@type neotree.Config?
	{
		window = {
			position = "float",
			popup = {
				border = "rounded",
				size = { width = 0.8, height = 0.9 },
			},
			mappings = {
				["<space>"] = "none",
			},
		},
		default_component_configs = {
			container = {
				enable_character_fade = true,
			},
			indent = {
				indent_size = 3,
				padding = 1,
				-- indent guides
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				-- expander config, needed for nesting files
				with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			},
			icon = {
				default = "",
				folder_closed = "",
				folder_empty = "",
				folder_empty_open = "",
				folder_open = "",
				use_filtered_colors = true,
			},
			name = {
				use_git_status_colors = false,
			},
			modified = {
				enabled = true,
				symbol = "unsaved!",
				highlight = "ErrorMsg",
			},
			git_status = {
				symbols = {
					-- Change type
					added = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = "~", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = "-", -- this can only be used in the git_status source
					renamed = "r", -- this can only be used in the git_status source
					-- Status type
					untracked = "[?]",
					ignored = "[/]",
					unstaged = "[M]",
					staged = "[A]",
					conflict = "[!]",
				},
			},
		},
	}
)
