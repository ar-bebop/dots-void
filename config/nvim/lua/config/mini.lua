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

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'none' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
vim.api.nvim_set_hl(0, 'MsgArea', { bg = 'none' })

vim.cmd('hi DiagnosticFloatingError guibg=none')
vim.cmd('hi DiagnosticFloatingHint guibg=none')
vim.cmd('hi DiagnosticFloatingInfo guibg=none')
vim.cmd('hi DiagnosticFloatingOk guibg=none')
vim.cmd('hi DiagnosticFloatingWarn guibg=none')

vim.cmd('hi DiffAdded guibg=none')
vim.cmd('hi DiffFile guibg=none')
vim.cmd('hi DiffLine guibg=none')
