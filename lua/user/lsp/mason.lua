local servers = {
	"bashls",
	"cssls",
	"html",
	"jsonls",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tailwindcss",
	"volar",
	"yamlls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)

	-- Takeover mode, overwrite default volar filetypes, and use it for everything js related
	lspconfig["volar"].setup({
		capabilities = opts.capabilities,
		on_attach = opts.on_attach,
		filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
		takeOverMode = { enabled = true },
	})
end
