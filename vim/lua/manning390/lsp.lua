local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.clangd.setup{
    init_options = {
        compilationDatabaseDirectory = "build"
    },
   capabilities = capabilities
}
lspconfig.phpactor.setup{
   capabilities = capabilities
}
lspconfig.clangd.setup{
   capabilities = capabilities
}
lspconfig.cmake.setup{
   capabilities = capabilities
}
lspconfig.tsserver.setup{
   capabilities = capabilities
}
lspconfig.vimls.setup{
   capabilities = capabilities
}
lspconfig.cssls.setup{}
lspconfig.gdscript.setup{
    cmd = {"ncat", "localhost", "6008"},
    capabilities = capabilities,
    on_attach = function (client)
        local _notify = client.notify
        client.notify = function (method, params)
            if method == 'textDocument/didClose' then
                return
            end
            _notify(method, params)
        end
    end
}

