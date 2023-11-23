-- LSP
-- Everything lsp related

return {
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
        lazy = true,
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('mason-lspconfig').setup()
            require('config.lsp')
        end
    },
    {
        'neovim/nvim-lspconfig',
        lazy = true,
    },
    {
        'williamboman/mason.nvim',
        lazy = true,
        cmd = 'Mason',
        priority = 900,
        config = true
    },
    {
        'nvimdev/lspsaga.nvim',
        lazy = true,
        event = 'LspAttach',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            symbol_in_winbar = {
                enable = false
            }
        }
    },
}
