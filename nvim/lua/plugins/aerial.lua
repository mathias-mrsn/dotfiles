return {
	{
		"stevearc/aerial.nvim",
		opts = function()
			local opts = {
				attach_mode = "global",
				backends = { "lsp", "treesitter", "markdown", "man" },
				show_guides = true,
				layout = {
					resize_to_content = false,
					default_direction = "left",
					max_width = { 60, 0.2 },
					width = 60,
					win_opts = {
						winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
						signcolumn = "yes",
						statuscolumn = " ",
					},
				},
				guides = {
					mid_item = "├╴",
					last_item = "└╴",
					nested_top = "│ ",
					whitespace = "  ",
				},
				on_attach = function(bufnr)
					vim.keymap.set("n", "}", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "{", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			}
			return opts
		end,
		keys = {
			{ "<leader>cs", "<cmd>AerialToggle left<cr>", desc = "Aerial (Symbols)" },
		},
	},
}
