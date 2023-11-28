-- MISC

return {
    {
        -- animations, operators, trailing space highlight
        -- also base16 theme
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
    },
    {
        'kevinhwang91/nvim-ufo',
        lazy = true,
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = { 'kevinhwang91/promise-async' },
        config = function()
            vim.o.foldcolumn = '1'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            require('ufo').setup()
        end
    },
    {
        -- Search and insert unicode icons
        'ziontee113/icon-picker.nvim',
        lazy = true,
        cmd = {
            'IconPickerNormal',
            'IconPickerInsert',
            'IconPickerYank'
        },
        dependencies = { 'stevearc/dressing.nvim' },
        opts = {
            disable_lagacy_commands = true
        }
    }
}
