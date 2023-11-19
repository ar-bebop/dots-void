-- GIT

return {
    -- Git signs in number column
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = true
}
