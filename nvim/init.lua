local vim = vim

vim.g.mapleader = " "

vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.winborder = "single"
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.showtabline = 0
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.colorcolumn = "81"
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.g.netrw_banner = false
vim.g.netrw_sort_by = "name"

vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/aznhe21/actions-preview.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },

	{ src = "https://github.com/nvim-treesitter/nvim-treesitter",          version = "main" },

	{ src = "https://github.com/folke/snacks.nvim",                        priority = 1000 },

	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- Editor
	-- { src = "https://github.com/norcalli/nvim-colorizer.lua" },
	{ src = "https://github.com/numToStr/Comment.nvim" },

	{ src = "https://github.com/RRethy/base16-nvim.git" },
	{ src = "https://github.com/maxmx03/solarized.nvim" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },

	-- Tmux
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },

	-- CMP
	{ src = "https://github.com/saghen/blink.cmp",                         version = vim.version.range("^1") },
	{ src = "https://github.com/fang2hou/blink-copilot" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/copilotlsp-nvim/copilot-lsp" },

	-- Formating
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- Motion
	{ src = "https://github.com/folke/flash.nvim" },

	-- Git
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

	-- IA
	{ src = "https://github.com/NickvanDyke/opencode.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/yetone/avante.nvim" },
})

-- local solarized = require('solarized')
-- vim.o.termguicolors = true
-- vim.o.background = 'dark'
-- solarized.setup({})
vim.cmd.colorscheme 'kanagawa'
vim.o.background = 'dark'

require("copilot").setup({})
require('render-markdown').setup({
})
require('avante').setup({
	-- Example: Using snacks.nvim as input provider
	-- mappings = {
	-- 	toggle = "<leader>A",
	-- 	ask = "<leader>E",
	-- },
	provider = "gemini",
	providers = {
		gemini = {
			api_key_name = { "cat", "~/.gemini/api.txt" }
		}
	},
	input = {
		provider = "snacks", -- "native" | "dressing" | "snacks"
		provider_opts = {
			-- Snacks input configuration
			title = "Avante Input",
			icon = " ",
			placeholder = "Enter your API key...",
		},
	},
	-- Your other config here!
})
require("blink.cmp").setup({
	fuzzy = { implementation = 'prefer_rust_with_warning' },
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

-- LSP
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

vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"terraformls",
		"ruff",
		"clangd",
		"tflint",
	},
})
require("mason-tool-installer").setup({
	ensure_installed = {
		"rust_analyzer",
	}
})

-- Snakes (picker, zen, etc.)
require("snacks").setup({
	zen = { enabled = true },
	notifier = {
		enabled = false,
		timeout = 3000
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
					{ win = "input", height = 1,          border = true,        title = "{title} {live} {flags}", title_pos = "center" },
					{ win = "list",  title = " Results ", title_pos = "center", border = true },
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

-- Format
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
		-- ["*"] = { "codespell" },
		-- ["_"] = { "trim_whitespace" },
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


-- vim.cmd.colorscheme("base16-black-metal-bathory")
vim.opt.shiftwidth = 8
vim.g.python_recommended_style = 1

-- Global Keymaps

for i = 1, 8 do
	vim.keymap.set({ "n", "t" }, "<Leader>" .. i, "<Cmd>tabnext " .. i .. "<CR>")
end

vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open Explorer" })

vim.keymap.set('n', '<leader>t', vim.diagnostic.open_float)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines one line below" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines one line above" })

-- vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
vim.keymap.set({ "n", }, "<c-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set({ "n", }, "<c-j>", ":TmuxNavigatedDown<CR>")
vim.keymap.set({ "n", }, "<c-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set({ "n", }, "<c-l>", ":TmuxNavigateRight<CR>")

-- Clear search, diff update and redraw
-- taken from LazyVim
vim.keymap.set(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / Clear hlsearch / Diff Update" }
)

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- Snacks Diagnostics (replacing Trouble)

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

-- Snacks Picker keymaps (replacing Telescope)
vim.keymap.set({ "n" }, "<leader>f", function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set({ "n" }, "<leader>g", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set({ "n" }, "<leader>b", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set({ "n" }, "<leader>si", function() Snacks.picker.grep_word() end, { desc = "Grep word" })
vim.keymap.set({ "n" }, "<leader>so", function() Snacks.picker.recent() end, { desc = "Recent files" })
vim.keymap.set({ "n" }, "<leader>sh", function() Snacks.picker.help() end, { desc = "Help pages" })
vim.keymap.set({ "n" }, "<leader>sm", function() Snacks.picker.man() end, { desc = "Man pages" })
vim.keymap.set({ "n" }, "<leader>sr", function() Snacks.picker.lsp_references() end, { desc = "LSP references" })
vim.keymap.set({ "n" }, "<leader>st", function() Snacks.picker.builtins() end, { desc = "All pickers" })
vim.keymap.set({ "n" }, "<leader>sd", function() Snacks.picker.registers() end, { desc = "Registers" })
vim.keymap.set({ "n" }, "<leader>sc", function() Snacks.picker.git_log_file() end, { desc = "Git commits for file" })


vim.cmd [[set completeopt+=menuone,noselect,popup]]

-- OpenCode Configuration
vim.g.opencode_opts = {
	auto_reload = true,
	provider = {
		enabled = "snacks",
	},
}

-- Terraform
vim.filetype.add({
	extension = {
		tf = "terraform"
	}
})

-- Additional Snacks keymaps
vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen mode" })
vim.keymap.set("n", "<leader>Z", function() Snacks.zen.zoom() end, { desc = "Toggle zoom" })

-- OpenCode keybindings
vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end,
	{ desc = "Ask OpenCode" })
vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end, { desc = "Execute OpenCode action" })
vim.keymap.set({ "n", "x" }, "ga", function() require("opencode").prompt("@this") end, { desc = "Add to OpenCode" })
vim.keymap.set({ "n", "t" }, "<leader>cc", function() require("opencode").toggle() end, { desc = "Toggle OpenCode" })
vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,
	{ desc = "OpenCode half page up" })
vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end,
	{ desc = "OpenCode half page down" })

vim.defer_fn(function()
	vim.opt.laststatus = 0
end, 100)
