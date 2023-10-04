local opt = vim.opt 

-- options to show the line number
opt.number = true

-- the number on the left will be relative to the cursor line
opt.relativenumber = true

-- tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace (idk what this line does)
opt.backspace = "indent,eol,start"

-- clipboard (force nvim to use system clipboard)
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8


-- "-" is part of the word
opt.iskeyword:append("-")

-- Avoid .swp files
opt.swapfile = false

