local opt = vim.opt -- for conciseness

opt.backup = false -- creates a backup file
opt.undofile = true -- enable persistent undo
opt.swapfile = false -- creates a swapfile
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- convert tabs to spaces
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- slit windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-") --consider the - as the part of the word

opt.cmdheight = 2

-- `` is visible in markdown files
opt.conceallevel = 0

-- the encoding written to a file
opt.fileencoding = "utf-8"
