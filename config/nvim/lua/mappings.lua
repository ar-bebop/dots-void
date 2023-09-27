local wk = require('which-key')
local set = vim.keymap.set
local telescope = require('telescope.builtin')
local kiwi = require('kiwi')

wk.register({
    ['<leader>f'] = {
        name = 'file',
        f = { telescope.find_files, 'find' },
        g = { telescope.live_grep, 'live grep' },
        o = { telescope.oldfiles, 'old' }
    },
    ['<leader>n'] = {
        name = 'nvim-tree',
        n = { '<cmd>NvimTreeToggle<cr>', 'toggle' },
        f = { '<cmd>NvimTreeFocus<cr>', 'focus' }
    },
    ['<leader>g'] = {
        name = 'get',
        d = { vim.lsp.buf.definition, 'definition' },
        D = { vim.lsp.buf.declaration, 'declaration'},
        i = { vim.lsp.buf.implementation, 'implementation' },
        t = { vim.lsp.buf.type_definition, 'type definition' },
        r = { vim.lsp.buf.references, 'references' },
        s = { vim.lsp.buf.signature_help, 'signature help' }
    },
    ['<leader>r'] = {
        name = 'refactor',
        r = { vim.lsp.buf.rename, 'rename' },
        f = { vim.lsp.buf.format, 'format' }
    },
    ['<leader>d'] = {
        name = 'diagnostic',
        s = { vim.diagnostic.open_float, 'show floating' },
        a = { vim.lsp.buf.code_action, 'code action' }
    },
    ['<leader><leader>'] = {
        name = 'buffer',
        d = { '<cmd>bd<cr>', 'delete' },
        w = { '<cmd>bw<cr>', 'wipeout' }
    },
    ['<leader>t'] = {
        name = 'tab',
        n = { '<cmd>tabnext<cr>', 'next' },
        p = { '<cmd>tabprevious<cr>', 'previous' },
        c = { '<cmd>tabclose<cr>', 'close' },
        t = { '<cmd>tabnew<cr>', 'new' }
    },
    ['<leader>w'] = {
        name = 'wiki',
        w = { kiwi.open_wiki_index, 'index' },
        d = { kiwi.open_diary_index, 'diary index' },
        n = { kiwi.open_diary_new, 'diary new' },
        t = { kiwi.todo.toggle, 'toggle task' },
    },
    ['<leader>m'] = {
        name = 'markdown',
        p = { '<cmd>MarkdownPreview<cr>', 'preview' },
        s = { '<cmd>MarkdownPreviewStop<cr>', 'stop' }
    },
    ['<leader>k'] = {
        name = 'kernel',
        i = { '<cmd>MagmaInit<cr>', 'init' },
        c = { '<cmd>MagmaRestart<cr>', 'clear & restart' },
        e = { '<cmd>MagmaReevaluateCell<cr>', 're-evaluate cell' },
        o = { '<cmd>MagmaShowOutput<cr>', 'show output' },
    }
})

set('n', '<tab>', '<cmd>bnext<cr>', { desc = 'next buffer' })
set('n', '<S-tab>', '<cmd>bNext<cr>', { desc = 'previous buffer' })
set('n', '<C-s>', '<cmd>write<cr>', { desc = 'write buffer' })

-- this is a very nasty hack, for some reason there is no reasonable way to map the below in lua,
-- so vimscript is used to map, along with empty lua mapping for description
-- set('n', '<leader>kr', '', { desc = 'evaluate operator' }) -- NVM THIS DIDNT WORK
vim.cmd('nnoremap <expr><silent> <leader>kr  nvim_exec("MagmaEvaluateOperator", v:true)')
