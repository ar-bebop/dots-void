return {
    'echasnovski/mini.nvim',
    version = '*',
    lazy = false,
    priority = 1000,
    config = function()
        require('mini.animate').setup()
        require('mini.surround').setup()
        require('mini.align').setup()
        require('mini.pairs').setup()
        require('mini.trailspace').setup()
    end
}
