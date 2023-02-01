local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')

local vim_capabilities = vim.lsp.protocol.make_client_capabilities()
vim_capabilities.textDocument.completion.completionItem.snippetSupport = true
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim_capabilities)

local langservers = {
  'tsserver',
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
  -- 'tailwindcss',
  'vimls',
  'cssls',
  'eslint',
  -- 'sumneko_lua'
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

vim.diagnostic.config({
    virtual_text = false
})
-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({'CursorHold,CursorHoldI'}, {
    pattern = {'*'},
    group = vim.api.nvim_create_augroup('diagnostic', {clear = true}),
    callback = function()
      vim.diagnostic.open_float(nil, {focus=false})
    end
})
