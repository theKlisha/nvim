return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = function()
		local nls = require("null-ls")
		return {
			sources = {
				nls.builtins.formatting.prettierd,
				nls.builtins.code_actions.eslint_d,
				nls.builtins.formatting.stylua,
				nls.builtins.diagnostics.flake8,
				nls.builtins.code_actions.gitsigns,
			},
		}
	end,
}
