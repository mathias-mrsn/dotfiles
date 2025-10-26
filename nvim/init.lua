local vim = vim

vim.g.mapleader = " "

vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.winborder = "single"
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.showtabline = 8
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
vim.g.netrw_liststyle = 1
vim.g.netrw_sort_by = "size"
vim.g.netrw_liststyle = 3

vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/aznhe21/actions-preview.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },

	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "0.1.8" },
	-- { src = "nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/LinArcX/telescope-env.nvim" },
	{ src = "https://github.com/RRethy/base16-nvim.git" },

	-- UI
	{ src = "https://github.com/folke/zen-mode.nvim" },

	-- Tmux
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },

	-- CMP
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	{ src = "https://github.com/fang2hou/blink-copilot" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },

	-- Formating
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- Trouble
	{ src = "https://github.com/folke/trouble.nvim" },

	-- Git
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/copilotlsp-nvim/copilot-lsp" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

require("copilot").setup({})
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

-- Conform
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
		rust = { "rustfmt", lsp_format = "fallback" },
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_format", "mypy", "isort" }
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
	-- format_on_save = {
	-- 	lsp_format = "fallback",
	-- 	timeout_ms = 500,
	-- },
	-- format_after_save = {
	-- 	lsp_format = "fallback",
	-- },
	log_level = vim.log.levels.ERROR,
	notify_on_error = true,
	notify_no_formatters = true,
})

-- Glabal Configuration

vim.cmd.colorscheme("base16-black-metal-gorgoroth")
vim.opt.shiftwidth = 8
vim.g.python_recommended_style = 0
-- dont remember why
vim.diagnostic.config({
	virtual_text = true,
})

-- Global Keymaps

vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open Explorer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines one line below" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines one line above" })

-- vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
vim.keymap.set({ "i", "n", "v" }, "<c-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set({ "i", "n", "v" }, "<c-j>", ":TmuxNavigatedDown<CR>")
vim.keymap.set({ "i", "n", "v" }, "<c-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set({ "i", "n", "v" }, "<c-l>", ":TmuxNavigateRight<CR>")

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

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- Trouble

require("trouble").setup({})

vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle({ mode = "diagnostic" })
end)

vim.keymap.set("n", "[t", function()
	require("trouble").next({ skip_groups = true, jump = true })
end)

vim.keymap.set("n", "]t", function()
	require("trouble").previous({ skip_groups = true, jump = true })
end)

-- Telescope

local telescope = require("telescope")
telescope.setup({
	defaults = {
		preview = { treesitter = false },
		color_devicons = true,
		sorting_strategy = "ascending",
		borderchars = {
			"─",
			"│",
			"─",
			"│",
			"┌",
			"┐",
			"┘",
			"└",
		},
		path_displays = { "smart" },
		layout_config = {
			height = 100,
			width = 400,
			prompt_position = "top",
			preview_cutoff = 40,
		},
		extensions = {
			fzf = {},
		},
	},
})
telescope.load_extension("ui-select")

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

require("mason").setup()
vim.lsp.enable({
	"lua_ls",
	"rust_analyzer",
	"clangd",
	"ruff",
})

local builtin = require("telescope.builtin")
vim.keymap.set({ "n" }, "<leader>f", builtin.find_files, { desc = "Telescope live grep" })
vim.keymap.set({ "n" }, "<leader>g", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set({ "n" }, "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set({ "n" }, "<leader>si", builtin.grep_string, { desc = "Telescope live string" })
vim.keymap.set({ "n" }, "<leader>so", builtin.oldfiles, { desc = "Telescope buffers" })
vim.keymap.set({ "n" }, "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set({ "n" }, "<leader>sm", builtin.man_pages, { desc = "Telescope man pages" })
vim.keymap.set({ "n" }, "<leader>sr", builtin.lsp_references, { desc = "Telescope tags" })
vim.keymap.set({ "n" }, "<leader>st", builtin.builtin, { desc = "Telescope tags" })
vim.keymap.set({ "n" }, "<leader>sd", builtin.registers, { desc = "Telescope tags" })
vim.keymap.set({ "n" }, "<leader>sc", builtin.git_bcommits, { desc = "Telescope tags" })
