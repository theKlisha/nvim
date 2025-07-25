return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	opts = {
		follow = false,
		focus = true,
		auto_refresh = false,
		-- auto_preview = false,
	},
	config = function(_, opts)
		require("trouble").setup(opts)
	end,
}
