-- TELESCOPE
-- Finder, used for many things,
-- fuzzy find files/text, select from list of options, etc.

return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = true,
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' }
}
