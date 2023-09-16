local lsp = require('lsp-zero').preset({
    name = 'recommended',
    float_border = 'single'
})

lsp.set_sign_icons {
    error = '⁉',
    warn = '⚠',
    hint = '∿',
    info = '»'
}

lsp.on_attach(function(client)
  -- Disable LSP semantic highlights
  client.server_capabilities.semanticTokensProvider = nil
end)

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup {
    mapping = {
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        -- changing the order of fields so the icon is the first
        fields = { 'menu', 'abbr', 'kind' },
        -- here is where the change happens
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '/',
                nvim_lua = 'Π',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
}
