return {
	"akinsho/toggleterm.nvim",
	cmd = {
		"OolongToggleShell",
		"OolongToggleLazygit",
	},
	opts = {
		direction = "float",
		float_opts = { border = "curved" },
		hidden = true,
		highlights = {
			NormalFloat = {
				link = "FloatNormal",
			},
			FloatBorder = {
                link = "FloatBorder"
			},
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		local shell = require("toggleterm.terminal").Terminal:new({
			shell = vim.o.shell,
			start_in_insert = true,
			on_open = function()
				vim.cmd("startinsert")
				vim.api.nvim_buf_set_keymap(0, "t", [[<Esc>]], [[<C-\><C-n>]], { noremap = true, silent = true })
			end,
		})

		local lazygit = require("toggleterm.terminal").Terminal:new({ cmd = "lazygit" })

		vim.api.nvim_create_user_command("OolongToggleShell", function()
			shell:toggle()
		end, {})

		vim.api.nvim_create_user_command("OolongToggleLazygit", function()
			lazygit:toggle()
		end, {})
	end,
}
