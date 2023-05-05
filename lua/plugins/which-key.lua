return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
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
				margin = (function()
					return { 2, vim.o.columns - 64, 1, 3 }
				end)(),
				padding = { 1, 0, 1, 0 },
				winblend = 0,
			},
		})
	end,
}
