local set = vim.keymap.set
local wk = require('which-key')
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
        name = 'neo-tree',
        n = { '<cmd>Neotree toggle<cr>', 'toggle' },
        f = { '<cmd>Nvimtree float<cr>', 'focus' }
    },
    ['<leader>l'] = {
        name = 'lsp',
        d = {
            name = 'diagnostics',
            f = { vim.diagnostic.open_float, 'open floating' },
            l = { vim.diagnostic.setloclist, 'add to location list' },
            a = { '<cmd>Lspsaga code_action<cr>', 'code action' },
            c = { '<cmd>Lspsaga incoming_calls<cr>' }
        },
        f = {
            name = 'find',
            d = { '<cmd>Lspsaga peek_definition<cr>', 'definition' },
            t = { '<cmd>Lspsaga peek_type_definition<cr>', 'type definition' },
            f = { '<cmd>Lspsaga finder<cr>', 'finder' },
            D = { vim.lsp.buf.declaration, 'declaration'},
            i = { vim.lsp.buf.implementation, 'implementation' },
            s = { vim.lsp.buf.signature_help, 'signature help' },
            r = { vim.lsp.buf.references, 'references' } },
        r = {
            name = 'refactor',
            r = { '<cmd>Lspsaga rename<cr>', 'rename' },
            f = { function() vim.lsp.buf.format { async = true } end, 'rename' }
        },
        w = {
            name = 'workspace',
            a = { vim.lsp.buf.add_workspace_folder, 'add' },
            r = { vim.lsp.buf.remove_workspace_folder, 'remove' },
            l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'list' },
        }
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
})

set('n', '<A-w>', '<cmd>WinShift<cr>', { desc = 'window move mode'})

set('n', '<tab>', '<cmd>bnext<cr>', { desc = 'next buffer' })
set('n', '<S-tab>', '<cmd>bNext<cr>', { desc = 'previous buffer' })
set('n', '<C-s>', '<cmd>write<cr>', { desc = 'write buffer' })
set('i', '<S-tab>', '<C-V><tab>', { desc = 'insert true tab'})

set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', { desc = 'next definition' })
set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', { desc = 'previous definition' })
set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { desc = 'hover doc' })
