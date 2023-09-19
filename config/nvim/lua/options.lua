local o = vim.opt
local g = vim.g

-- Indents
o.expandtab = true -- Expand tabs to spaces
o.tabstop = 4 -- Spaces in a tab
o.softtabstop = 4 -- Spaces that are inputed for each tab while in editing mode
o.shiftwidth = 4 -- Spaces for each (auto)indent

-- Searching
o.ignorecase = true -- Ignores case in search
o.smartcase = true -- Overrides ignorecase if search contains upper case
o.incsearch = true -- Show pattern while typing

-- Line numbers
o.number = true -- Line numbers
o.numberwidth = 2 -- Space between numbers and window
o.signcolumn = 'yes' -- Show signs, "yes" always leaves space for signs

-- ETC --
o.mouse = 'a' -- Enable mouse
o.undofile = true
o.swapfile = false
o.termguicolors = true
o.scrolloff = 16
o.fillchars:append('eob: ')
o.updatetime = 100

g.mapleader = ' '
