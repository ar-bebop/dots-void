return {
    'echasnovski/mini.nvim',
    version = '*',
    lazy = false,
    priority = 1000,
    config = function()
        require('config.mini')
    end
}
