-- HIGHLIGHTS

return {
    {
        -- Indentation, scope, newlines, etc.
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = { char = '│' },
            scope = { highlight = 'LineNr' }
        }
    },
    {
        -- Color codes, e.g. hex, rgb, etc.
        'uga-rosa/ccc.nvim',
        opts = { highlighter = { auto_enable = true, lsp = true } },
    }
}
