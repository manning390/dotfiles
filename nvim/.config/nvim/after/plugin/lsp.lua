local formatAu = vim.api.nvim_create_augroup('format_write', { clear = true })

-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
    -- Eslint is 'special' and can't actually format stuff since it's a fixer.
    -- So we just swap in the lsp format with their command
    if (client.name == 'eslint') then
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.cmd('EslintFixAll')
            -- fidget.notify("Format")
        end, { desc = 'Format current buffer with EslintFixAll' })
    else
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
            -- fidget.notify("Format")
        end, { desc = 'Format current buffer with LSP' })
    end

    -- vim.api.nvim_clear_autocmds({ group = formatAu, buffer = bufnr })
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --     group = formatAu,
    --     buffer = bufnr,
    --     command = ':Format'
    -- })
end

local efm_languages = {
    -- typescript = {
    --     require 'efmls-configs.linters.eslint',
    --     require 'efmls-configs.formatters.prettier',
    -- },
    lua = {
        require 'efmls-configs.formatters.stylua'
    }
}
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
    -- emmet_ls = {
    --     filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte', 'vue' },
    -- },
    emmet_language_server = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte', 'vue' },
    },
    cmake = {},
    phpactor = {},
    tailwindcss = {},
    vimls = {},
    cssls = {},
    eslint = {
        -- on_attach = function(client, bufnr)
        --     print('I attached eslint')
        --     -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        --     --     print('I tried to format with eslint')
        --     --     -- vim.cmd(":EslintFixAll")
        --     -- end, { desc = 'Format current buffer with LSP' })
        -- end,
    },
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        }
    },
    efm = {
        filetypes = vim.tbl_keys(efm_languages),
        settings = {
            rootMarkers = { ".git/" },
            languages = efm_languages
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
        },
    },
    jsonls = {},
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
