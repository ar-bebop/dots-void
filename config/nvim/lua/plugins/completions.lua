-- COMPLETIONS

return {
    {
        -- Completions plugin
        'ms-jpq/coq_nvim',
        branch = 'coq',
        event = 'BufEnter',
        config = function ()
            vim.cmd('COQnow --shut-up')
        end
    },
    {
        -- Snippets
        'ms-jpq/coq.artifacts',
        branch = 'artifacts'
    }
}
