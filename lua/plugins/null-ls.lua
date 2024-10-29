return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = function()
		local nls = require("null-ls")
		return {
			sources = {
				nls.builtins.code_actions.gitsigns,
				nls.builtins.formatting.prettierd,
				nls.builtins.formatting.stylua,
			},
		}
	end,
}
