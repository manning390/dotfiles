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
        on_attach = function(_, bufnr)
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.cmd('EslintFixAll')
            end, { desc = 'Format current buffer with LSP' })
        end,
    },
    lua_ls = {
        on_init = function(client)
            local path = client.workspace_folders[1].name
            if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        },
                        telemetry = { enable = false },
                        diagnostics = { globals = { 'vim', 'require' } }
                    }
                })
                client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
            end
            return true
        end,
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

-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup(vim.tbl_extend('force', {
            capabilities = capabilities,
            on_attach = on_attach,
        }, servers[server_name] or {}))
    end,
}
