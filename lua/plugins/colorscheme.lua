return {
	"savq/melange-nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		if vim.env.TERM_PROGRAM ~= "Apple_Terminal" then
			vim.opt.termguicolors = true
			vim.cmd([[colorscheme melange]])
		else
			vim.opt.termguicolors = false
			local palette = require("mini.base16").mini_palette("#292929", "#c4bc76", 50)
			require("mini.base16").setup({ palette = palette })
		end
	end,
}
