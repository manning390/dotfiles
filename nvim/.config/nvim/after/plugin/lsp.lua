local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')


-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

local servers = {
    tsserver = {},
    clangd = {
        init_options = {
            compilationDatabaseDirectory = "build"
        }
    },
    -- gdscript = {
    --     cmd = {"ncat", "localhost", "6008"},
    --     on_attach = function (client)
    --         local _notify = client.notify
    --         client.notify = function (method, params)
    --             if method == 'textDocument/didClose' then
    --                 return
    --             end
    --             _notify(method, params)
    --         end
    --     end
    -- },
    emmet_ls = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
    },
    cmake = {},
    phpactor = {},
    tailwindcss = {},
    vimls = {},
    cssls = {},
    eslint = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        }
    }
}

vim.diagnostic.config({
    virtual_text = false,
    float = {
        source = true,
    }
})

require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to serveres
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}

-- Turn on lsp status information
require('fidget').setup()
