-- COMPLETIONS

return {
    {
        -- Completions plugin
        'ms-jpq/coq_nvim',
        branch = 'coq',
        lazy = true,
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = { 'ms-jpq/coq.artifacts' },
        config = function ()
            vim.cmd('COQnow --shut-up')
        end
    },
    {
        -- Snippets
        'ms-jpq/coq.artifacts',
        lazy = true,
        branch = 'artifacts'
    }
}
