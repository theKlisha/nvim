local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("options")

require("lazy").setup("plugins", {
	ui = { border = "rounded" },
	colorscheme = { "melange" },
	defaults = {
		version = "*", -- enable this to try installing the latest stable versions of plugins
	},
})
