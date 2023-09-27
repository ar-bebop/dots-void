require('mini.animate').setup()
require('mini.surround').setup()
require('mini.align').setup()
require('mini.pairs').setup()
require('mini.trailspace').setup()

require('mini.base16').setup({
    palette = require('config.colors'),
    plugins = {
        default = false,
        ['echasnovski/mini.nvim'] = true,
        ['folke/lazy.nvim'] = true,
        ['folke/which-key.nvim'] = true,
        ['lukas-reineke/indent-blankline.nvim'] = true,
        ['nvim-telescope/telescope.nvim'] = true,
        ['nvim-tree/nvim-tree.lua'] = true,
        ['williamboman/mason.nvim'] = true
    }
})

-- GENERAL
vim.cmd('hi Normal guibg=none')
vim.cmd('hi NormalNC guibg=none')
vim.cmd('hi NormalFloat guibg=none')
vim.cmd('hi WinSeparator guibg=none')
vim.cmd('hi SignColumn guibg=none')
vim.cmd('hi LineNr guibg=none')
vim.cmd('hi MsgArea guibg=none')

-- LSP GROUPS
vim.cmd('hi DiagnosticFloatingError guibg=none')
vim.cmd('hi DiagnosticFloatingHint guibg=none')
vim.cmd('hi DiagnosticFloatingInfo guibg=none')
vim.cmd('hi DiagnosticFloatingOk guibg=none')
vim.cmd('hi DiagnosticFloatingWarn guibg=none')

-- GIT GROUPS
vim.cmd('hi DiffAdded guibg=none')
vim.cmd('hi DiffFile guibg=none')
vim.cmd('hi DiffLine guibg=none')
vim.cmd('hi DiffChange guibg=none')

-- WHICH-KEY GROUPS
vim.cmd('hi WhichKeyFloat guibg=none')
vim.cmd('hi WhichKeySeparator guibg=none')
