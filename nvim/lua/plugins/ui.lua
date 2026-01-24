return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"RRethy/base16-nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"maxmx03/solarized.nvim",
		lazy = true,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
	},
	{
		"oskarnurm/koda.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("koda").setup({
				bold = true,
				italic = true,
				transparent = true,
				colors = {
					bg = "#000000",
					fg = "#b0b0b0",
					line = "#272727",
					paren = "#4d4d4d",
					keyword = "#777777",
					dim = "#50585d",
					comment = "#50585d",
					border = "#ffffff",
					emphasis = "#ffffff",
					func = "#ffffff",
					string = "#ffffff",
					const = "#d9ba73",
					highlight = "#0058d0",
					info = "#8ebeec",
					success = "#86cd82",
					warning = "#d9ba73",
					danger = "#ff7676",
				},
			})

			vim.cmd.colorscheme("base16-black-metal-gorgoroth")
			vim.o.background = "dark"

			vim.defer_fn(function()
				vim.opt.laststatus = 0
			end, 100)
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("snacks").setup({
				zen = { enabled = true },
				notifier = {
					enabled = false,
					timeout = 3000,
				},
				input = {},
				terminal = {},
				indent = { enabled = true },
				picker = {
					enabled = true,
					layout = {
						reverse = true,
						layout = {
							box = "horizontal",
							backdrop = false,
							width = 0,
							height = 0,
							border = "none",
							{
								box = "vertical",
								{
									win = "input",
									height = 1,
									border = true,
									title = "{title} {live} {flags}",
									title_pos = "center",
								},
								{
									win = "list",
									title = " Results ",
									title_pos = "center",
									border = true,
								},
							},
							{
								win = "preview",
								title = "{preview:Preview}",
								width = 0.45,
								border = true,
								title_pos = "center",
							},
						},
					},
				},
				statuscolumn = { enabled = true },
				words = { enabled = true },
				scroll = { enabled = true },
				explorer = { enabled = false },
			})
			_G.Snacks = require("snacks")

			-- Snacks Diagnostics keymaps
			vim.keymap.set("n", "<leader>x", function()
				Snacks.picker.diagnostics()
			end, { desc = "Show diagnostics" })

			-- Navigation with words module
			vim.keymap.set("n", "[t", function()
				Snacks.words.jump(-1)
			end, { desc = "Previous reference" })

			vim.keymap.set("n", "]t", function()
				Snacks.words.jump(1)
			end, { desc = "Next reference" })

			-- Snacks Picker keymaps
			vim.keymap.set({ "n" }, "<leader>f", function()
				Snacks.picker.files()
			end, { desc = "Find files" })
			vim.keymap.set({ "n" }, "<leader>g", function()
				Snacks.picker.grep()
			end, { desc = "Grep" })
			vim.keymap.set({ "n" }, "<leader>b", function()
				Snacks.picker.buffers()
			end, { desc = "Buffers" })
			vim.keymap.set({ "n" }, "<leader>si", function()
				Snacks.picker.grep_word()
			end, { desc = "Grep word" })
			vim.keymap.set({ "n" }, "<leader>so", function()
				Snacks.picker.recent()
			end, { desc = "Recent files" })
			vim.keymap.set({ "n" }, "<leader>sh", function()
				Snacks.picker.help()
			end, { desc = "Help pages" })
			vim.keymap.set({ "n" }, "<leader>sm", function()
				Snacks.picker.man()
			end, { desc = "Man pages" })
			vim.keymap.set({ "n" }, "<leader>sr", function()
				Snacks.picker.lsp_references()
			end, { desc = "LSP references" })
			vim.keymap.set({ "n" }, "<leader>st", function()
				Snacks.picker.builtins()
			end, { desc = "All pickers" })
			vim.keymap.set({ "n" }, "<leader>sd", function()
				Snacks.picker.registers()
			end, { desc = "Registers" })
			vim.keymap.set({ "n" }, "<leader>sc", function()
				Snacks.picker.git_log_file()
			end, { desc = "Git commits for file" })

			-- Zen mode keymaps
			vim.keymap.set("n", "<leader>z", function()
				Snacks.zen()
			end, { desc = "Toggle Zen mode" })
			vim.keymap.set("n", "<leader>Z", function()
				Snacks.zen.zoom()
			end, { desc = "Toggle zoom" })
		end,
	},
}
