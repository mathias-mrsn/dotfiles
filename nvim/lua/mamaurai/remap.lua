vim.g.mapleader = " "

-- open the explorer
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- move text in file
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move faster in the file
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- find the replace the buffer selected
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- give the access to exec the current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
