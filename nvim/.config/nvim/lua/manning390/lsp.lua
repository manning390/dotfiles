local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'

local vim_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim_capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local langservers = {
    clangd = {
        init_options = {
            compilationDatabaseDirectory = "build"
        }
    },
    gdscript = {
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
    },
    emmet_ls = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    },
    'cmake',
    'phpactor',
    'tsserver',
    'vimls',
    'cssls',
    'sumneko_lua'
}

-- Loop through langservers and do basic setup
for k, v in pairs(langservers) do
  local c = {capabilities = capabilities}
  if type(v) == 'table' then
    for _, t in pairs(v) do table.insert(c, t) end
    v = k
  end
  lspconfig[v].setup(c)
end
