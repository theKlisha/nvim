local function bind(fn, ...)
	local args = { ... }
	return function()
		return fn(unpack(args))
	end
end

local format_buffer = bind(vim.lsp.buf.format, { asyc = true })

local git_stage_hunk = function()
	require("gitsigns").stage_hunk()
end

local git_stage_buffer = function()
	require("gitsigns").stage_buffer()
end

local git_reset_hunk = function()
	require("gitsigns").reset_hunk()
end

local git_reset_buffer = function()
	require("gitsigns").reset_buffer()
end

local git_blame_line = function()
	require("gitsigns").blame_line()
end

local delete_buffer = function()
	require("mini.bufremove").delete(0, false)
end

local delete_buffer_force = function()
	require("mini.bufremove").delete(0, true)
end

local open_file_tree = "<cmd>Neotree source=filesystem position=float dir=./ reveal_force_cwd<cr>";

local open_file_picker = function()
	require("telescope.builtin").find_files()
end

local open_file_picker_at_cwd = function()
	require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })
end

local open_project_picker = function()
	require("telescope").extensions.repo.list({
		file_ignore_patterns = { "^" .. vim.env.HOME .. "/%.cache/", "^" .. vim.env.HOME .. "/%.cargo/" },
	})
end

local open_buffer_picker = function()
	local opts = require("telescope.themes").get_dropdown({ shorten_path = true })
	require("telescope.builtin").buffers(opts)
end

local open_last_picker = function()
	require("telescope.builtin").resume()
end

local global_search_in_workspace = function()
    require("telescope.builtin").live_grep()
end

local exec = function(cmd)
	return function()
		vim.api.nvim_exec(cmd, false)
	end
end

local sh = function(cmd)
    return function()
        vim.fn.system(cmd)
    end
end

return {
	"mrjones2014/legendary.nvim",
	event = "VimEnter",
	opts = {
		keymaps = {
			-- shamelessly copied from https://docs.helix-editor.com/keymap.html

			-- Misc
			{ "=", format_buffer, description = "Format buffer (LSP)" },

			-- Space mode
			{ "<leader>f", open_file_picker, description = "Open file picker" },
			{ "<leader>F", open_file_picker_at_cwd, description = "Open file picker at current working directory" }, -- FIXME
			{ "<leader>e", open_file_tree, description = "Open file tree" },
			{ "<leader>p", open_project_picker, desc = "Open project picker" },
			{ "<leader>b", open_buffer_picker, description = "Open jumplist picker" },
			{ "<leader>k", vim.lsp.buf.hover, description = "Show documentation for item under cursor in a popup (LSP)" },
			{ "<leader>i", vim.lsp.buf.signature_help, description = "Show signature information (LSP)" },
			{ "<leader>s", vim.lsp.buf.document_symbol, description = "Open document symbol picker (LSP)" },
			{ "<leader>S", vim.lsp.buf.workspace_symbol, description = "Open workspace symbol picker (LSP)" },
			{ "<leader>d", vim.diagnostic.setloclist, description = "Open document diagnostics picker (LSP)" }, -- FIXME
			{ "<leader>D", vim.diagnostic.open_float, description = "Open workspace diagnostics picker (LSP)" }, -- FIXME
			{ "<leader>r", vim.lsp.buf.rename, description = "Rename symbol (LSP)" },
			{ "<leader>a", vim.lsp.buf.code_action, description = "Apply code action (LSP)" },
			{ "<leader>'", open_last_picker, description = "Open last fuzzy picker" },
			{ "<leader>w", "<c-w>", description = "Enter window mode" },
			-- p	Paste system clipboard after selections	paste_clipboard_after
			-- P	Paste system clipboard before selections	paste_clipboard_before
			-- y	Join and yank selections to clipboard	yank_joined_to_clipboard
			-- Y	Yank main selection to clipboard	yank_main_selection_to_clipboard
			-- R	Replace selections by clipboard contents	replace_selections_with_clipboard
			{ "<leader>/", global_search_in_workspace, description = "Global search in workspace folder" },
			{ "<leader>?", "<cmd>Legendary<cr>", description = "Open command palette" },

			-- Goto mode
			{ "gi", vim.lsp.buf.implementation, description = "Go to implementation (LSP)" },
			{ "gd", "<cmd>Trouble lsp_definitions<CR>", description = "LSP Definitions" },
			{ "gr", "<cmd>Trouble lsp_references<CR>", description = "Go to references (LSP)" },
			{ "g.", "<cmd>`.<CR>", description = "Go to last modification in current file" },

			-- Move mode
			{ "m]", "<cmd>BufferLineCycleNext<CR>", description = "Go to next buffer" },
			{ "m[", "<cmd>BufferLineCyclePrev<CR>", description = "Go to previous buffer" },
			{ "mq", delete_buffer, desc = "Delete Buffer" },
			{ "mQ", delete_buffer_force, desc = "Delete Buffer (Force)" },

			-- Source control mode
            { "ss", sh([[tmux new-window lazygit -ucd ~/.config/nvim/ext/lazygit/]]), description = "Open lazygit" },
			{ "sa", git_stage_hunk, description = "Git stage hunk" },
			{ "sA", git_stage_buffer, description = "Git stage buffer" },
			{ "sr", git_reset_hunk, description = "Git reset hunk" },
			{ "sR", git_reset_buffer, description = "Git reset buffer" },
			{ "se", "<cmd>Neotree source=git_status position=float dir=./<cr>", description = "Open git status file tree" },
			{ "sb", git_blame_line, description = "Blame line (Git)" },
		},
		funcs = {
			-- { telescope("help_tags"), description = "Find help pages" },
			-- { telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
			-- { telescope("oldfiles"), description = "Find Recent files" },
			{ sh([[tmux new-window -n "nvim config" -c ~/.config/nvim/ nvim]]), description = "Open configuration" },
			{ exec([[Lazy]]), description = "Open plugin manager" },
			{ exec([[Alpha]]), description = "Open home screen" },
			{ exec([[LspInfo]]), description = "Open LSP info" },
			{ exec([[Mason]]), description = "Open LSP server manager" },
			{ exec([[BufferLineSortByRelativeDirectory]]), description = "Sort buffers by relative directory" },
		},
		select_prompt = "",
		include_builtin = true,
	},
}
