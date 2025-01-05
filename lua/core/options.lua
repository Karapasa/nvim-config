vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.viewoptions:remove "curdir"
vim.opt.shortmess:append { s = true, I = true }
vim.opt.backspace:append { "nostop" }

vim.opt.breakindent = true
vim.opt.backup = false -- creates a backup file
vim.opt.cmdheight = 0 -- more space in the neovim command line for displaying messages
vim.opt.copyindent = true
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.cursorline = true -- highlight the current line
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.history = 100
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.numberwidth = 1 -- set number column width to 2 {default 4}
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.scrolloff = 4 -- is one of my fav
vim.opt.showmode = false --  -- INSERT -- 
vim.opt.sidescrolloff = 4
vim.opt.smartcase = true -- smart case
vim.opt.spell = false -- disable spell checking
vim.opt.spelllang = "en" -- language for spell checking
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 500 -- timeout length
vim.opt.title = true -- set the title of window to the value of the titlestring
-- vim.opt.titlestring = "%<%F - nvim" -- what the title of the window will be set to
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited

vim.opt.showtabline = 2 -- always show tabs
vim.opt.laststatus = 2 -- hide statusline

vim.wo.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.wo.linebreak = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = false

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
