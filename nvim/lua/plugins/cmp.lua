return {
	{
		"saghen/blink.cmp",
		version = "v1.*",
		event = "InsertEnter",
		dependencies = {
			"fang2hou/blink-copilot",
		},
		config = function()
			require("blink.cmp").setup({
				fuzzy = { implementation = "prefer_rust_with_warning" },
				sources = {
					default = { "lsp", "path", "buffer", "snippets", "copilot" },
					providers = {
						copilot = {
							name = "copilot",
							module = "blink-copilot",
							score_offset = 100,
							async = true,
						},
						snippets = {
							score_offset = 100,
						},
					},
				},
			})
		end,
	},
}
