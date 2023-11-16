-- WIKI

return {
    {
        -- Simple nvim wiki
        'serenevoid/kiwi.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true,
        opts = {
            { name = 'notes', path = os.getenv('HOME') .. '/notes' }
        }
    },
    {
        -- Preview markdown files in browser
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
        config = function()
            vim.g.mkdp_browser = 'qutebrowser'
        end
    }
}
