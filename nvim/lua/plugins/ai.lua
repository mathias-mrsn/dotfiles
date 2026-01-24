return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	},
	{
		"copilotlsp-nvim/copilot-lsp",
		dependencies = { "zbirenbaum/copilot.lua" },
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		build = "make",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
		},
		config = function()
			require("render-markdown").setup({})
			require("avante").setup({
				provider = "claude",
				providers = {
					claude = {
					}
				},
				behaviour = {
					auto_suggestions = false,
					auto_set_highlight_group = true,
					auto_set_keymaps = true,
					auto_apply_diff_after_generation = false,
					support_paste_from_clipboard = false,
				},
				hints = { enabled = true },
				windows = {
					position = "right",
					wrap = true,
					width = 30,
					sidebar_header = {
						align = "center",
						rounded = true,
					},
				},
				input = {
					provider = "snacks",
					provider_opts = {
						title = "Avante Input",
						icon = " ",
						placeholder = "Enter your API key...",
					},
				},
			})
		end,
	},
	{
		"NickvanDyke/opencode.nvim",
		config = function()
			vim.g.opencode_opts = {
				auto_reload = true,
				provider = {
					enabled = "snacks",
				},
			}

			-- OpenCode keybindings
			vim.keymap.set(
				{ "n", "x" },
				"<C-a>",
				function()
					require("opencode").ask("@this: ", { submit = true })
				end,
				{ desc = "Ask OpenCode" }
			)
			vim.keymap.set(
				{ "n", "x" },
				"<C-x>",
				function()
					require("opencode").select()
				end,
				{ desc = "Execute OpenCode action" }
			)
			vim.keymap.set(
				{ "n", "x" },
				"ga",
				function()
					require("opencode").prompt("@this")
				end,
				{ desc = "Add to OpenCode" }
			)
			vim.keymap.set(
				{ "n", "t" },
				"<leader>cc",
				function()
					require("opencode").toggle()
				end,
				{ desc = "Toggle OpenCode" }
			)
			vim.keymap.set(
				"n",
				"<S-C-u>",
				function()
					require("opencode").command("session.half.page.up")
				end,
				{ desc = "OpenCode half page up" }
			)
			vim.keymap.set(
				"n",
				"<S-C-d>",
				function()
					require("opencode").command("session.half.page.down")
				end,
				{ desc = "OpenCode half page down" }
			)
		end,
	},
}
