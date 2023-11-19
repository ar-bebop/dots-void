-- HIGHLIGHTS

return {
    {
        -- Indentation, scope, newlines, etc.
        'lukas-reineke/indent-blankline.nvim',
        lazy = true,
        event = { 'BufReadPost', 'BufNewFile' },
        main = 'ibl',
        opts = {
            indent = { char = '│' },
            scope = { highlight = 'LineNr' }
        }
    },
    {
        -- Color codes, e.g. hex, rgb, etc.
        'uga-rosa/ccc.nvim',
        lazy = true,
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            highlighter = {
                auto_enable = true,
                lsp = true
            }
        },
    }
}
