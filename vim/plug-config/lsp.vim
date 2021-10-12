lua << EOF
local lspconfig = require'lspconfig'
lspconfig.clojure_lsp.setup{
    root_dir = lspconfig.util.root_pattern('server/project.clj', 'project.clj', 'deps.edn', '.git', '*/project.clj')
}
lspconfig.tsserver.setup{}
lspconfig.vimls.setup{}
lspconfig.gdscript.setup{
    cmd = {"ncat", "localhost", "6008"},
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
-- lspconfig.phpactor.setup{} -- Requires installation https://phpactor.readthedocs.io/en/master/usage/standalone.html#global-installation
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF
