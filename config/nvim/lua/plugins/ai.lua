return {
    'jackMort/ChatGPT.nvim',
    lazy = true,
    cmd = {
        'ChatGPT',
        'ChatGPTRun',
        'ChatGPTCompleteCode',
        'ChatGPTEditWithInstructions'
    },
    dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim'
    },
    config = true
}
