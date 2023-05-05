return {
	"akinsho/toggleterm.nvim",
	cmd = {
		"OolongToggleShell",
		"OolongToggleLazygit",
	},
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return vim.o.lines * 0.5
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		direction = "float",
		float_opts = { border = "curved" },
		hidden = true,
		highlights = {
			NormalFloat = {
				link = "FloatNormal",
			},
			FloatBorder = {
				link = "FloatBorder",
			},
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		local shell = require("toggleterm.terminal").Terminal:new({
			shell = vim.o.shell,
			start_in_insert = true,
			on_open = function(term)
				-- vim.cmd("startinsert")
				term:set_mode("i")
				vim.api.nvim_buf_set_keymap(0, "t", [[<Esc>]], [[<C-\><C-n>]], { noremap = true, silent = true })
			end,
		})

		local lazygit = require("toggleterm.terminal").Terminal:new({
			cmd = "lazygit -ucd ~/.config/nvim/ext/lazygit/",
		})

		vim.api.nvim_create_user_command("OolongToggleShell", function()
			if lazygit:is_open() then
				lazygit:close()
			else
				shell:toggle()
			end
		end, {})

		vim.api.nvim_create_user_command("OolongToggleLazygit", function()
			if shell:is_open() then
				shell:close()
			else
				lazygit:toggle()
			end
		end, {})
	end,
}
