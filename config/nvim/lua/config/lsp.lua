local lspconfig = require 'lspconfig'
local coq = require 'coq'

-- AUTOMATIC LSP SETUP
require('mason-lspconfig').setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        lspconfig[server_name].setup {}
        lspconfig[server_name].setup(coq.lsp_ensure_capabilities({}))
    end,
}
