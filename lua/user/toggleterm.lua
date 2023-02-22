local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	direction = "float",
	float_opts = { border = "curved" },
	hidden = true,
})

local Terminal = require("toggleterm.terminal").Terminal
local opts = { noremap = true, silent = true }

local term = Terminal:new({
	shell = vim.o.shell,
	start_in_insert = true,
	on_open = function(t)
		vim.cmd("startinsert")
		vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], opts)
	end,
})

local lazygit = Terminal:new({
	cmd = "lazygit",
	on_open = function(t)
		vim.api.nvim_buf_set_keymap(0, "t", "q", "<Esc>", opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "q", opts)
	end,
})

vim.keymap.set("n", [[<C-\>]], function()
	term:toggle()
end, opts)

vim.keymap.set("t", [[<C-\>]], function()
	term:toggle()
end, opts)

vim.keymap.set("n", "<leader>gg", function()
	lazygit:toggle()
end, opts)
