local o = vim.opt
local g = vim.g

-- Indents
o.autoindent = true
o.smartindent = true
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4

-- Searching
o.ignorecase = true
o.smartcase = true
o.incsearch = true

-- Line numbers
o.number = true
o.numberwidth = 4
o.signcolumn = 'yes'

-- Folds --
o.foldcolumn = '4'
o.fillchars:append('foldopen:,foldclose:')

-- ETC --
o.mouse = 'a'
o.undofile = true
o.swapfile = false
o.termguicolors = true
o.scrolloff = 16
o.fillchars:append('eob: ')
o.updatetime = 100
o.relativenumber = true

-- TITLE --
o.title = true
o.titlestring = '%((%{expand("%:~:.:h")})%) %t%( %m%) - nvim '

g.mapleader = ' '
