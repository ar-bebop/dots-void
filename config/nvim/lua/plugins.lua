-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, 'lazy')
if not ok then return end

lazy.setup {
    {
        'echasnovski/mini.nvim',
        version = '*',
        lazy = false,
        priority = 1000,
        config = function()
            require('config.mini')
        end
    },
    {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('alpha').setup(require('alpha.themes.theta').config)
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('config.treesitter')
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = ':MasonUpdate'
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },
        config = function()
            require('config.lsp')
        end
    },
    {
        'jay-babu/mason-null-ls.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'jose-elias-alvarez/null-ls.nvim'
        },
        config = function()
            require('config.null-ls')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = require('config.lualine')
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = true
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            show_current_context = true,
            show_current_context_start = true
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        config = true
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 400
        end,
        opts = {
            icons = {
                breadcrumb = '↳',
                separator = '~',
                group = '+'
            },
            window = {
                border = 'single',
                margin = { 1, 0.2, 1, 0.2 },
                padding = { 1, 1, 1, 1 },
            },
            layout = {
                height = { min = 4, max = 20 },
                width = { min = 20, max = 40 },
                spacing = 2
            }
        }
    },
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end
    },
    {
        'serenevoid/kiwi.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true,
        opts = {
            { name = 'notes', path = os.getenv('HOME') .. '/notes' }
        }
    },
    {
        'mickael-menu/zk-nvim',
        config = function()
            require('zk').setup({
                picker = 'telescope',
                lsp = {
                    config = {
                        cmd = { 'zk', 'lsp' },
                        name = 'zk'
                    },
                    auto_attach = {
                        enabled = true,
                        filetypes = { 'markdown' }
                    }
                }
            })
        end
    },
    {
        'uga-rosa/ccc.nvim',
        opts = { highlighter = { auto_enable = true, lsp = true } },
    },
}
