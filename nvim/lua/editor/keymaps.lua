local map = vim.keymap.set

map("n", "<leader>e", ":Explore<CR>", { desc = "Open Explorer" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines one line below" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines one line above" })

map("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

-- Split window
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
