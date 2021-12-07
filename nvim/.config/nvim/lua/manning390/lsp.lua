local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')

local vim_capabilities = vim.lsp.protocol.make_client_capabilities()
--vim_capabilities.textDocument.completion.completionItem.snippetSupport = true
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim_capabilities)

if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      -- autostart = true;
      cmd = { 'ls_emmet', '--stdio' };
      filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
        'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end

local langservers = {
  clojure_lsp = {
    root_dir = lspconfig.util.root_pattern('server/project.clj', 'project.clj', 'deps.edn', '.git', '*/project.clj');
  },
  'html',
  'vimls',
  'cssls',
  'ls_emmet',
  'tailwindcss',
  'tsserver',
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
