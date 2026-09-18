return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		{
			"j-hui/fidget.nvim",
			opts = {},
		},
	},

	config = function()
		-- LSP keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, {
						buffer = event.buf,
						desc = "LSP: " .. desc,
					})
				end

				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				map("gr", require("telescope.builtin").lsp_references, "Goto References")
				map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")

				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

				map("<leader>rn", vim.lsp.buf.rename, "Rename")
				map("<leader>ca", vim.lsp.buf.code_action, "Code Action")

				map("K", vim.lsp.buf.hover, "Hover")
				map("gD", vim.lsp.buf.declaration, "Goto Declaration")
			end,
		})

		-- Completion capabilities
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Language servers
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},

			pylsp = {},

			bashls = {},

			sqlls = {},

			html = {
				filetypes = { "html", "twig", "hbs" },
			},

			cssls = {},

			arduino_language_server = {
				cmd = {
					"arduino-language-server",
					"-cli",
					"/usr/bin/arduino-cli",
					"-cli-config",
					vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
					"-clangd",
					vim.fn.expand("~/.local/share/nvim/mason/bin/clangd"),
				},
			},
		}

		-- Setup Mason
		require("mason").setup()

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"arduino-language-server",
				"clangd",
			},
		})

		-- Setup LSP servers
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}

					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
