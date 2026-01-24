local vim = vim

-- Set leader key before lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Vim options
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
vim.opt.completeopt = { "menuone", "noselect", "popup" }

-- Netrw settings
vim.g.netrw_banner = false
vim.g.netrw_sort_by = "name"

-- Python style
vim.g.python_recommended_style = 1

-- Terraform filetype
vim.filetype.add({
	extension = {
		tf = "terraform",
	},
})

-- Load lazy.nvim with plugins
require("lazy").setup("plugins", {
	install = {
		colorscheme = { "base16-black-metal-gorgoroth" },
	},
	checker = {
		enabled = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- Global Keymaps
for i = 1, 8 do
	vim.keymap.set({ "n", "t" }, "<Leader>" .. i, "<Cmd>tabnext " .. i .. "<CR>")
end

vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open Explorer" })
vim.keymap.set("n", "<leader>t", vim.diagnostic.open_float)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines one line below" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines one line above" })

-- Tmux navigation
vim.keymap.set({ "n" }, "<c-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set({ "n" }, "<c-j>", ":TmuxNavigatedDown<CR>")
vim.keymap.set({ "n" }, "<c-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set({ "n" }, "<c-l>", ":TmuxNavigateRight<CR>")

-- Clear search, diff update and redraw
vim.keymap.set(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- Visual mode indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Window splits
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- Set completeopt
vim.cmd([[set completeopt+=menuone,noselect,popup]])
