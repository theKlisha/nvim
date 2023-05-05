return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = function()
		local nls = require("null-ls")
		return {
			sources = {
				nls.builtins.code_actions.eslint_d,
				nls.builtins.code_actions.gitsigns,
				nls.builtins.diagnostics.flake8,
				nls.builtins.formatting.prettierd,
				nls.builtins.formatting.stylua,
			},
		}
	end,
}
