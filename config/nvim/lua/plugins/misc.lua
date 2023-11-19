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
