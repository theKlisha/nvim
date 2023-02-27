local opts = { noremap = true, silent = true }
local shell = nil
local lazygit = nil

local function term_toggle()
	if shell == nil then
		shell = require("toggleterm.terminal").Terminal:new({
			shell = vim.o.shell,
			start_in_insert = true,
			on_open = function()
				vim.cmd("startinsert")
				vim.api.nvim_buf_set_keymap(0, "t", [[<Esc>]], [[<C-\><C-n>]], opts)
			end,
		})
	end

	shell:toggle()
end

local function lazygit_toggle()
	if lazygit == nil then
		lazygit = require("toggleterm.terminal").Terminal:new({ cmd = "lazygit" })
	end

	lazygit:toggle()
end

return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ [[<C-\>]], term_toggle, mode = { "n", "t" }, desc = "Toggle terminal" },
		{ [[<leader>gg]], lazygit_toggle, desc = "Open lazygit" },
	},
	opts = {
		direction = "float",
		float_opts = { border = "curved" },
		hidden = true,
	},
}
