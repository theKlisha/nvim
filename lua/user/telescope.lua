local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },
		mappings = {
			i = {
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<S-Down>"] = actions.cycle_history_next,
				["<S-Up>"] = actions.cycle_history_prev,
				["<Esc>"] = actions.close,
			},
		},
	},
})

require("project_nvim").setup({
	detection_methods = { "pattern" }, -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
	patterns = { ".git", "Makefile", "package.json" }, -- patterns used to detect root dir, when **"pattern"** is in detection_methods
})

telescope.load_extension("projects")
telescope.load_extension("file_browser")
