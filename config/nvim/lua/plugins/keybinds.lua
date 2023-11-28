-- KEYBINDS

return {
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 400
        end,
        opts = {
            icons = {
                breadcrumb = '↳',
                separator = '~',
                group = '+'
            },
            window = {
                border = 'single',
                margin = { 1, 0.2, 1, 0.2 },
                padding = { 1, 1, 1, 1 },
            },
            layout = {
                height = { min = 4, max = 20 },
                width = { min = 20, max = 40 },
                spacing = 2
            }
        }
    },
    {
        'sudormrfbin/cheatsheet.nvim',
        lazy = true,
        cmd = 'Cheatsheet',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim'
        }
    }
}
