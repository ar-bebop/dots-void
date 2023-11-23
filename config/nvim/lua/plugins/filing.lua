-- FILING
return {
    {
        -- Side bar file manager
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        cmd = 'Neotree',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
            -- '3rd/image.nvim' -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        opts = {
            close_if_last_window = true,
            window = {
                width = 30
            }
        }
    },
    {
        -- Edit directory in buffer
        'stevearc/oil.nvim',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            default_file_explorer = true
        }
    }
}
