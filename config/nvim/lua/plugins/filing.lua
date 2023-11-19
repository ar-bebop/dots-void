-- FILING

return {
    {
        -- Side bar file manager
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
            -- '3rd/image.nvim' -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = true
    },
    {
        -- Edit directory in buffer
        'stevearc/oil.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = true
    }
}
