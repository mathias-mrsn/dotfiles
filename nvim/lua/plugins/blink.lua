return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",

	version = "*",
	opts = {
		keymap = { preset = "default" },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		-- completion = {
		-- 	documentation = {
		-- 		auto_show = true,
		-- 		auto_show_delay_ms = 500,
		-- 	},
		-- },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}

-- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
-- ['<C-e>'] = { 'hide' },
-- ['<C-y>'] = { 'select_and_accept' },
--
-- ['<Up>'] = { 'select_prev', 'fallback' },
-- ['<Down>'] = { 'select_next', 'fallback' },
-- ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
-- ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
--
-- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
-- ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
--
-- ['<Tab>'] = { 'snippet_forward', 'fallback' },
-- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
--
-- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
