-- FILING

return {
    {
        -- Side bar file manager
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = true
    },
    {
        -- Edit directory in buffer
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true
    }
}
