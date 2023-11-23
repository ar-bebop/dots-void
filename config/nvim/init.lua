require('options')

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

local lazy_opts = {
    ui = {
        border = 'single'
    },
    change_detection = {
        enabled = false,
        notify = false
    }
}

lazy.setup('plugins', lazy_opts)

require('mappings')

vim.cmd.colorscheme('base16')
