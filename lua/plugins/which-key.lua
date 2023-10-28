return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 1000
		require("which-key").setup({
			layout = {
				height = { min = 4, max = 25 },
				width = { min = 58, max = 58 },
				spacing = 3,
				align = "right",
			},
			window = {
				border = "rounded",
				position = "bottom",
				margin = { 0, 4, 2, 3 },
				padding = { 0, 0, 0, 0 },
				winblend = 0,
			},
		})
	end,
}
