return {
	"folke/which-key.nvim",
	opts = {},
	config = function(_, opts)
		require("which-key").setup(opts)
	end,
}