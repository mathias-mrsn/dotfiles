local map = vim.keymap.set

map("n", "<leader>e", ":Oil<CR>", { desc = "Open Explorer" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines one line below" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines one line above" })

map("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
