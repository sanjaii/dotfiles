return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "rubocop" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.gopls.setup({
				opts = {
					servers = {
						gopls = {
							settings = {
								gopls = {
									gofumpt = true,
									codelenses = {
										gc_details = false,
										generate = true,
										regenerate_cgo = true,
										run_govulncheck = true,
										test = true,
										tidy = true,
										upgrade_dependency = true,
										vendor = true,
									},
									hints = {
										assignVariableTypes = true,
										compositeLiteralFields = true,
										compositeLiteralTypes = true,
										constantValues = true,
										functionTypeParameters = true,
										parameterNames = true,
										rangeVariableTypes = true,
									},
									analyses = {
										fieldalignment = true,
										nilness = true,
										unusedparams = true,
										unusedwrite = true,
										useany = true,
									},
									usePlaceholders = true,
									completeUnimported = true,
									staticcheck = true,
									directoryFilters = {
										"-.git",
										"-.vscode",
										"-.idea",
										"-.vscode-test",
										"-node_modules",
									},
									semanticTokens = true,
								},
							},
						},
					},
					setup = {
						gopls = function(_, opts)
							LazyVim.lsp.on_attach(function(client, _)
								if not client.server_capabilities.semanticTokensProvider then
									local semantic = client.config.capabilities.textDocument.semanticTokens
									client.server_capabilities.semanticTokensProvider = {
										full = true,
										legend = {
											tokenTypes = semantic.tokenTypes,
											tokenModifiers = semantic.tokenModifiers,
										},
										range = true,
									}
								end
							end, "gopls")
						end,
					},
				},
			})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"ray-x/go.nvim",
		config = function()
			require("go").setup()

			-- Run gofmt + goimport on save
			local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					require("go.format").goimport()
				end,
				group = format_sync_grp,
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
		keys = {
			{ "<leader>gaj", "<cmd>GoAddTag<cr>", desc = "Add json tags" },
			{ "<leader>gam", "<cmd>GoAddTag mapstructure<cr>", desc = "Add mapstructure tags" },
			{ "<leader>gae", "<cmd>GoAddTag env<cr>", desc = "Add env tags" },
			{ "<leader>gay", "<cmd>GoAddTag yaml<cr>", desc = "Add YAML tags" },
			{ "<leader>gim", "<cmd>GoImplements<cr>", desc = "Find implementions of this method" },
		},
	},
}
