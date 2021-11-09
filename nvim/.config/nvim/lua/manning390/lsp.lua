local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.clojure_lsp.setup{
    root_dir = lspconfig.util.root_pattern('server/project.clj', 'project.clj', 'deps.edn', '.git', '*/project.clj'),
    capabilities = capabilities
}
lspconfig.tsserver.setup{
   capabilities = capabilities
}
lspconfig.vimls.setup{
   capabilities = capabilities
}

lspconfig.cssls.setup{}
