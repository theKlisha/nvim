return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		highlight = { enable = true },
		indent = { enable = true, disable = { "python" } },
		context_commentstring = { enable = true, enable_autocmd = false },
		ensure_installed = {
			"bash",
			"help",
			"javascript",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"vim",
			"typescript",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
