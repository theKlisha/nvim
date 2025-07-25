-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
	-- NOTE: Yes, you can install new plugins here!
	"mfussenegger/nvim-dap",
	-- NOTE: And you can specify dependencies as well
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",

		-- Required dependency for nvim-dap-ui
		"nvim-neotest/nvim-nio",

		-- Installs the debug adapters for you
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		-- Add your own debuggers here
		"leoluz/nvim-dap-go",
	},
	keys = function(_, keys)
		local dap = require("dap")
		local dapui = require("dapui")
		return {
			-- Basic debugging keymaps, feel free to change to your liking!
			{ "<F5>", dap.continue, desc = "Debug: Start/Continue" },
			{ "<F6>", dap.step_out, desc = "Debug: Step Out" },
			{ "<F7>", dap.step_over, desc = "Debug: Step Over" },
			{ "<F8>", dap.step_into, desc = "Debug: Step Into" },
			{ "<leader>B", dap.toggle_breakpoint, desc = "Debug: Toggle Breakpoint" },
			-- {
			--   '<leader>B',
			--   function()
			--     dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
			--   end,
			--   desc = 'Debug: Set Breakpoint',
			-- },
			-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
			{ "<F10>", dapui.toggle, desc = "Debug: See last session result" },
			{
				"<F12>",
				function()
					dapui.float_element("repl")
				end,
				desc = "Debug: Open repl",
			},

			unpack(keys),
		}
	end,
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				"delve",
			},
		})

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup({
			icons = { expanded = "", collapsed = "", current_frame = "" },
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			element_mappings = {},
			expand_lines = vim.fn.has("nvim-0.7") == 1,
			force_buffers = true,
			layouts = {
				{
					elements = { "console" },
					size = 20,
					position = "top",
				},
				{
					elements = { "breakpoints", "watches" },
					size = 20,
					position = "bottom",
				},
			},
			floating = {
				max_height = nil,
				max_width = nil,
				border = "single",
				mappings = {
					["close"] = { "q", "<Esc>" },
				},
			},
			controls = {
				enabled = vim.fn.exists("+winbar") == 1,
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
					disconnect = "",
				},
			},
			render = {
				max_type_length = nil, -- Can be integer or nil.
				max_value_lines = 100, -- Can be integer or nil.
				indent = 1,
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Install golang specific config
		require("dap-go").setup({
			delve = {
				-- On Windows delve must be run attached or it crashes.
				-- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
				detached = vim.fn.has("win32") == 0,
			},
		})
	end,
}
