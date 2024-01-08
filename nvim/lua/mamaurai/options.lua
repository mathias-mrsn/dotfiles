local options = {
    number = true,
    relativenumber = true,
    tabstop = 2,
    shiftwidth = 2,
    expandtab = true,
    autoindent = true,
    smartindent = true,
    cursorline = true,
    termguicolors = true,
    splitright = true,
    splitbelow = true,
    scrolloff = 8,
    swapfile = false
}

-- clipboard (force nvim to use system clipboard)
vim.opt.clipboard:append("unnamedplus")

for opt, value in pairs(options) do
  vim.opt[opt] = value
end
