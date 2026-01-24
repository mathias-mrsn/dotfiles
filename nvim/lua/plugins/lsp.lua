return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"mason-lspconfig.nvim",
		},
		config = function()
			-- LSP attach autocmd
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("my.lsp", {}),
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
					if client:supports_method("textDocument/completion") then
						local chars = {}
						for i = 32, 126 do
							table.insert(chars, string.char(i))
						end
						client.server_capabilities.completionProvider.triggerCharacters = chars
						vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
					end
				end,
			})

			-- Diagnostic configuration
			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			})
		end,
	},
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"terraformls",
					"ruff",
					"clangd",
					"tflint",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"rust_analyzer",
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "goimports", "gofmt" },
					rust = { "rustfmt", lsp_format = "fallback" },
					python = function(bufnr)
						if require("conform").get_formatter_info("ruff_format", bufnr).available then
							return { "ruff_format" }
						else
							return { "isort", "black" }
						end
					end,
					terraform = { "terraform_fmt" },
					tf = { "terraform_fmt" },
				},
				default_format_opts = {
					lsp_format = "fallback",
				},
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 500,
				},
				format_after_save = {
					lsp_format = "fallback",
				},
				log_level = vim.log.levels.ERROR,
				notify_on_error = true,
				notify_no_formatters = true,
			})
		end,
	},
	{
		"aznhe21/actions-preview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
