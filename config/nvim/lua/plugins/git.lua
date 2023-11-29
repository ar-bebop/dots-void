-- GIT

return {
    {
        -- Git signs in number column
        'lewis6991/gitsigns.nvim',
        lazy = true,
        event = { 'BufReadPost', 'BufNewFile' },
        config = true
    },
    {
        'akinsho/git-conflict.nvim',
        version = '*',
        lazy = true,
        event = { 'BufReadPost', 'BufNewFile' },
        config = true
    }
}
