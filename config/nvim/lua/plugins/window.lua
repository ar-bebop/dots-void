-- WINDOW

return {
    {
        'sindrets/winshift.nvim',
        lazy = true,
        cmd = 'WinShift',
        config = true
    },
    {
        'anuvyklack/windows.nvim',
        lazy = true,
        event = 'VeryLazy',
        dependencies = {
            'anuvyklack/middleclass',
            'anuvyklack/animation.nvim'
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup({
                animation = {
                    enable = true,
                    duration = 200,
                    fps = 120,
                }
            })
        end
    }
}
