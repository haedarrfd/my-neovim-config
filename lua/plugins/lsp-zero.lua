return {
	"neovim/nvim-lspconfig",
	enabled = true,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("luasnip.loaders.from_vscode").lazy_load()
		require("fidget").setup()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"cssmodules_ls",
				"html",
				"denols",
				"pyright",
				"tailwindcss",
				"intelephense",
				"vuels",
				"jsonls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function()
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, {})
				vim.keymap.set("n", "<leader>gd", function()
					vim.lsp.buf.definition()
				end, {})
				vim.keymap.set("n", "<leader>gr", function()
					vim.lsp.buf.references()
				end, {})
				vim.keymap.set("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, {})
				vim.keymap.set("n", "<leader>rn", function()
					vim.lsp.buf.rename()
				end, {})
				vim.keymap.set("n", "<leader>sh", function()
					vim.lsp.buf.signature_help()
				end, {})
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, {})
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, {})
				vim.keymap.set("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, {})
				vim.keymap.set("n", "<leader>f", function()
					vim.lsp.buf.format()
				end, {})
				vim.keymap.set("n", "<leader>td", function()
					vim.lsp.buf.type_definition()
				end, {})
			end,
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

	--	vim.diagnostic.config({
			-- update_in_insert = true,
	--		float = {
	--			focusable = false,
	--			style = "minimal",
	--			border = "rounded",
	--			source = "always",
	--			header = "",
	--			prefix = "",
	--		},
	--	})
	end,
}
