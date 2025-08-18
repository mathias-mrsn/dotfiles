return {
	-- {
	-- 	"saghen/blink.cmp",
	-- 	dependencies = {
	-- 		"rafamadriz/friendly-snippets",
	-- 		"giuxtaposition/blink-cmp-copilot",
	-- 	},
	--
	-- 	version = "1.*",
	-- 	opts = {
	-- 		keymap = { preset = "default" },
	--
	-- 		appearance = {
	-- 			nerd_font_variant = "mono",
	-- 		},
	--
	-- 		completion = { documentation = { auto_show = true } },
	--
	-- 		sources = {
	-- 			default = { "lsp", "path", "snippets", "buffer", "copilot" },
	-- 			providers = {
	-- 				copilot = {
	-- 					name = "copilot",
	-- 					module = "blink-cmp-copilot",
	-- 					score_offset = 100,
	-- 					async = true,
	-- 				},
	-- 			},
	-- 		},
	--
	-- 		fuzzy = { implementation = "prefer_rust_with_warning" },
	-- 	},
	-- 	opts_extend = { "sources.default" },
	-- },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"hrsh7th/cmp-nvim-lsp", -- source for file system paths
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"rafamadriz/friendly-snippets", -- useful snippets
			"onsails/lspkind.nvim", -- vs-code like pictograms
		},
		config = function()
			local cmp = require("cmp")

			local luasnip = require("luasnip")

			local lspkind = require("lspkind")

			-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				window = {
					completion = {
						border = "single",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
					},
					documentation = {
						border = "single",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
					},
				},
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				snippet = { -- configure how nvim-cmp interacts with snippet engine
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-k>"] = cmp.mapping.scroll_docs(-4),
					["<C-j>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}), -- confirm selection
					-- ["<C-r>"] = cmp.mapping.open_docs(),
					-- ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-u>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "copilot", group_index = 2 },
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- snippets
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
				}),

				-- configure lspkind for vs-code like pictograms in completion menu
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
