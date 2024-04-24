vim.g.mapleader = ' '

-- exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- move text in file
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- open file explorer
vim.keymap.set('n', '<leader>e', ':Ex<CR>')
