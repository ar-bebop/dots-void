return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        priority = 900,
        config = true
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        lazy = false,
        priority = 800,
        config = true
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
        lazy = false,
        priority = 700,
        config = function()
            require('config.lsp')
        end
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
