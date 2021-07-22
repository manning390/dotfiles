lua << EOF
local lspconfig = require'lspconfig'
lspconfig.clojure_lsp.setup{
    root_dir = lspconfig.util.root_pattern('server/project.clj', 'project.clj', 'deps.edn', '.git', '*/project.clj')
}
lspconfig.tsserver.setup{}
lspconfig.vimls.setup{}
EOF
