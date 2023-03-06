return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	config = function()
		require("lualine").setup({
			sections = {
				lualine_c = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						-- color = { fg = "#ff9e64" },
					},
				},
			},
		})
	end,
}
