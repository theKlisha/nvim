return { -- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", opts = {} },

		-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		{ "folke/neodev.nvim", opts = {} },

		{
			"nvim-java/nvim-java",
			opts = {},
			config = function ()
				require('java').setup()
				require('lspconfig').jdtls.setup({})
			end,
		},
	},
	config = function()
		--  This function gets run when an LSP attaches to a particular buffer.
		--    That is to say, every time a new file is opened that is associated with
		--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
		--    function will be executed to configure the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Jump to the definition of the word under your cursor.
				--  This is where a variable was first declared, or where a function is defined, etc.
				--  To jump back, press <C-t>.
				-- map("gd", require("telescope.builtin").lsp_definitions, "Goto definition")

				-- WARN: This is not Goto Definition, this is Goto Declaration.
				--  For example, in C this would take you to the header
				-- map("gD", vim.lsp.buf.declaration, "Goto declaration")

				-- Find references for the word under your cursor.
				-- map("gr", require("telescope.builtin").lsp_references, "Goto references")

				-- Jump to the implementation of the word under your cursor.
				--  Useful when your language has ways of declaring types without an actual implementation.
				map("gI", require("telescope.builtin").lsp_implementations, "Goto implementation")

				-- Jump to the type of the word under your cursor.
				--  Useful when you're not sure what type a variable is and you want to see
				--  the definition of its *type*, not where it was *defined*.
				map("<leader>d", require("telescope.builtin").lsp_type_definitions, "Type definition")

				-- Fuzzy find all the symbols in your current document.
				--  Symbols are things like variables, functions, types, etc.
				map("<leader>s", require("telescope.builtin").lsp_document_symbols, "Document symbols")

				-- Fuzzy find all the symbols in your current workspace
				--  Similar to document symbols, except searches over your whole project.
				map("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")

				-- Rename the variable under your cursor
				--  Most Language Servers support renaming across files, etc.
				map("<leader>r", vim.lsp.buf.rename, "Rename")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>a", vim.lsp.buf.code_action, "Code action")

				-- Opens a popup that displays documentation about the word under your cursor
				--  See `:help K` for why this keymap
				map("<leader>k", vim.lsp.buf.hover, "Hover documentation")

				-- Format the current buffer
				map("<leader>=", function()
					vim.lsp.buf.format({ async = true })
				end, "Format buffer")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					-- 	buffer = event.buf,
					-- 	callback = vim.lsp.buf.document_highlight,
					-- })
					--
					-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					-- 	buffer = event.buf,
					-- 	callback = vim.lsp.buf.clear_references,
					-- })
				end
			end,
		})

		-- Ensure the servers and tools are installed
		--  To check the current status of installed tools and/or manually install
		--  other tools, you can run
		--    :Mason
		--
		--  You can press `g?` for help in this menu
		require("mason").setup({
			-- Set border style for Mason UI
			ui = { border = "rounded" },
		})

		local mason_registry = require("mason-registry")

		-- LSP servers and clients are able to communicate to each other what features they support.
		--  By default, Neovim doesn't support everything that is in the LSP Specification.
		--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		-- Enable the following language servers
		--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
		--
		--  Add any additional override configuration in the following tables. Available keys are:
		--  - cmd (table): Override the default command used to start the server
		--  - filetypes (table): Override the default list of associated filetypes for the server
		--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		--  - settings (table): Override the default settings passed when initializing the server.
		--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
		local servers = {
			-- See `:help lspconfig-all` for a list of all the pre-configured LSPs
			-- Some languages (like typescript) have entire language plugins that can be useful:
			--    https://github.com/pmizio/typescript-tools.nvim
			--
			-- But for many setups, the LSP (`tsserver`) will work just fine
			-- tsserver = {},

			clangd = {},
			gopls = {},
			html = {},
			pyright = {},
			rust_analyzer = {},
			templ = {},

			volar = {
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				init_options = {
					vue = {
						hybridMode = false,
					},
				},
			},

			htmx = {
				filetypes = { "html", "templ" },
			},

			lua_ls = {
				-- cmd = {...},
				-- filetypes { ...},
				-- capabilities = {},
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },
					},
				},
			},

			yamlls = {
				settings = {
					yaml = {
						format = {
							enable = true,
							singleQuote = true,
						},
						schemas = {
							kubernetes = "kubectl-edit-*.yaml",
							["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
							["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
						},
					},
				},
			},

			jdtls = {
				settings = {
					java = {
						configuration = {
							runtimes = {
								{
									name = "OpenJDK-17",
									path = "/Users/gjanysek/.jenv/versions/17",
									default = true,
								}
							}
						}
					}
				}
			},
		}

		-- Add custom filetypes
		vim.filetype.add({ extension = { templ = "templ" } })

		-- Automatically install the servers above
		require("mason-tool-installer").setup({ vim.tbl_keys(servers) })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

		-- Set the border style for LSP windows
		require("lspconfig.ui.windows").default_options.border = "rounded"
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
	end,
}
