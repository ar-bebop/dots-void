-- MISC

local fold_handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

return {
    {
        -- animations, operators, trailing space highlight
        -- also base16 theme
        'echasnovski/mini.nvim',
        version = '*',
        lazy = false,
        priority = 1000,
        config = function()
            require('mini.surround').setup()
            require('mini.align').setup()
            require('mini.pairs').setup()
            require('mini.trailspace').setup()
        end
    },
    {
        -- better folding
        'kevinhwang91/nvim-ufo',
        lazy = true,
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = { 'kevinhwang91/promise-async' },
        config = function()
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            require('ufo').setup({
                fold_virt_text_handler = fold_handler
            })
        end
    },
    {
        -- search and insert unicode icons
        'ziontee113/icon-picker.nvim',
        lazy = true,
        cmd = {
            'IconPickerNormal',
            'IconPickerInsert',
            'IconPickerYank'
        },
        dependencies = { 'stevearc/dressing.nvim' },
        opts = {
            disable_lagacy_commands = true
        }
    }
}
