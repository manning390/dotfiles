lua << EOF
local lspconfig = require'lspconfig'
lspconfig.clojure_lsp.setup{
    root_dir = lspconfig.util.root_pattern('server/project.clj', 'project.clj', 'deps.edn', '.git', '*/project.clj'),
    capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
lspconfig.tsserver.setup{
   capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
lspconfig.vimls.setup{
   capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

lspconfig.cssls.setup{}
EOF
