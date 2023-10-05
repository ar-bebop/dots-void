return {
    'serenevoid/kiwi.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    opts = {
        { name = 'notes', path = os.getenv('HOME') .. '/notes' }
    }
}
