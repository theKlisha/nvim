if vim.env.TERM_PROGRAM ~= "Apple_Terminal" then
	vim.opt.termguicolors = true
	require("oolong").setup()
else
	vim.opt.termguicolors = false
	local palette = require("mini.base16").mini_palette("#292929", "#c4bc76", 50)
	require("mini.base16").setup({ palette = palette })
end
