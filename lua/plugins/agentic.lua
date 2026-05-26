local animation =
{ "⡀", "⠄", "⠂", "⠁", "⠈", "⠐", "⠠", "⢀", "⣀", "⢄", "⢂", "⢁", "⢈", "⢐", "⢠", "⣠", "⢤", "⢢", "⢡", "⢨", "⢰", "⣰", "⢴",
	"⢲", "⢱", "⢸", "⣸", "⢼", "⢺", "⢹", "⣹", "⢽", "⢻", "⣻", "⢿", "⣿", }

require("agentic").setup({
	-- Any ACP-compatible provider works. Built-in: "claude-agent-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp" | "copilot-acp" | "auggie-acp" | "mistral-vibe-acp" | "cline-acp" | "goose-acp"
	provider = "claude-agent-acp", -- setting the name here is all you need to get started
	windows = {
		position = "bottom", -- "right", "left", or "bottom"
	},
	diff_preview = {
		layout = "inline",
	},
	spinner_chars = {
		generating = animation,
		thinking = animation,
		searching = animation,
		busy = animation,
	},
	message_icons = {
		thinking = "[Grinding]",
		finished = "[Finished]",
		stopped = "[Stopped]",
		error = "[Error]",
	},
})

require("which-key").add({
	{
		"<leader>ll",
		function() require("agentic").toggle() end,
		mode = { "n", "v" },
		desc = "Toggle Agentic Chat"
	},
	{
		"<leader>la",
		function() require("agentic").add_selection_or_file_to_context() end,
		mode = { "n", "v" },
		desc = "Add file or selection to Agentic to Context"
	},
	{
		"<leader>ln",
		function() require("agentic").new_session() end,
		mode = { "n", "v", },
		desc = "New Agentic Session"
	},
	{
		"<leader>lr", -- ai Restore
		function()
			require("agentic").restore_session()
		end,
		desc = "Agentic Restore session",
		silent = true,
		mode = { "n", "v" },
	},
	{
		"<leader>ld", -- ai Diagnostics
		function()
			require("agentic").add_current_line_diagnostics()
		end,
		desc = "Add current line diagnostic to Agentic",
		mode = { "n" },
	},
	{
		"<leader>lD", -- ai all Diagnostics
		function()
			require("agentic").add_buffer_diagnostics()
		end,
		desc = "Add all buffer diagnostics to Agentic",
		mode = { "n" },
	},
})
