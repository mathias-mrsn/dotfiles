local map = vim.keymap.set

map("n", "<leader>e", ":Explore<CR>", { desc = "Open Explorer" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines one line below" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines one line above" })

map("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

-- Split window
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- Indent without quitting visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- New File
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Clear search, diff update and redraw
-- taken from LazyVim
map(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- thanks prime
map("x", "<leader>p", [["_dP]])

map("n", "<leader>rr", "<cmd>e<cr>", { desc = "Reload File" })
