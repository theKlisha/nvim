return {
	"neovim/nvim-lspconfig",
	version = nil,
	commit = "master", -- use latest
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "LspInfo" },
	dependencies = {
		-- "mason.nvim",
		-- "hrsh7th/nvim-cmp",
		"williamboman/mason-lspconfig.nvim",
		{ "hrsh7th/cmp-nvim-lsp", opts = { sources = { { name = "nvim_lsp" } } } },
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
		{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
	},

	opts = {
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 4, prefix = "●" },
			severity_sort = true,
		},

		-- options for vim.lsp.buf.format
		-- `bufnr` and `filter` is handled by the LazyVim formatter,
		-- but can be also overridden when specified
		format = {
			formatting_options = nil,
			timeout_ms = nil,
		},

		-- LSP Server Settings
		servers = {
			lua_ls = {
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
				end,
			},
			volar = {
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
				end,
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
				takeOverMode = { enabled = true },
				commands = {
					-- _typescript.applyRenameFile is not part of the LSP standard
					TSRenameFile = {
						function()
							local source_file = vim.api.nvim_buf_get_name(0)

							vim.ui.input({
								prompt = "Source : ",
								completion = "file",
								default = source_file,
							}, function(target_file)
								if target_file ~= nil and target_file ~= source_file then
									local params = {
										command = "_typescript.applyRenameFile",
										arguments = {
											{
												sourceUri = source_file,
												targetUri = target_file,
											},
										},
										title = "",
									}
									vim.lsp.buf.execute_command(params)
									vim.lsp.util.rename(source_file, target_file, {})
								end
							end)
						end,
						description = "Rename current typescript file",
					},
				},
			},
		},

		-- you can do any additional lsp server setup here
		-- return true if you don't want this server to be setup with lspconfig
		setup = {
			-- example to setup with typescript.nvim
			-- tsserver = function(_, opts)
			--   require("typescript").setup({ server = opts })
			--   return true
			-- end,
			-- Specify * to use this function as a fallback for any server
			-- ["*"] = function(server, opts) end,
		},
	},

	config = function(_, opts)
		local servers = opts.servers
		local capabilities = vim.tbl_extend(
			"keep",
			require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
			require("lsp-status").capabilities
		)

		local function setup(server)
			local server_opts = vim.tbl_deep_extend("force", {
				capabilities = vim.deepcopy(capabilities),
			}, servers[server] or {})

			if opts.setup[server] then
				if opts.setup[server](server, server_opts) then
					return
				end
			elseif opts.setup["*"] then
				if opts.setup["*"](server, server_opts) then
					return
				end
			end
			require("lspconfig")[server].setup(server_opts)
		end

		-- local mlsp = require("mason-lspconfig")
		-- local available = mlsp.get_available_servers()

		-- local ensure_installed = {}
		-- for server, server_opts in pairs(servers) do
		-- 	if server_opts then
		-- 		server_opts = server_opts == true and {} or server_opts
		-- 		-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
		-- 		if server_opts.mason == false or not vim.tbl_contains(available, server) then
		-- 			setup(server)
		-- 		else
		-- 			ensure_installed[#ensure_installed + 1] = server
		-- 		end
		-- 	end
		-- end

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

		require("lspconfig.ui.windows").default_options.border = "rounded"
		-- require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
		require("mason-lspconfig").setup_handlers({ setup })
	end,
}
