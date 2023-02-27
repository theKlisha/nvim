return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	opts = {
		automatic_installation = true,
		ensure_installed = {
			"lua-language-server",
			"vue-language-server",
			"stylua",
			"rust-analyzer",
			"pyright",
			"css-lsp",
			"html-lsp",
			"json-lsp",
		},
	},
	config = function(plugin, opts)
		require("mason").setup(opts)
		local mr = require("mason-registry")
		for _, tool in ipairs(opts.ensure_installed) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}
