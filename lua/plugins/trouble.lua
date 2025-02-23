return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	opts = {
		follow = false,
		focus = true,
	},
	config = function(_, opts)
		require("trouble").setup(opts)
	end,
}
