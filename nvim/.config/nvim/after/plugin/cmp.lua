local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item {behavior = cmp.SelectBehavior.Insert },
        ['<C-e>'] = cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Insert },
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ["<C-q>"] = cmp.mapping.abort(),
        ["<C-space>"] = cmp.mapping {
            i = cmp.mapping.complete(),
            c = function(
                _ --[[fallback]]
            )
                if cmp.visible() then
                    if not cmp.confirm { select = true } then
                        return
                    end
                else
                    cmp.complete()
                end
            end,
        },
        ['<esc>'] = cmp.mapping.close(),
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        -- Configuration Opions
        --     keyword_length
        --     priority (also ordering sources in list)
        --     max_item_count
        { name = 'nvim_lua'},
        { name = 'nvim_lsp'},
        { name = 'nvim_lsp_signature_help'},
        { name = 'path'},
        { name = 'luasnip'},
        { name = 'buffer', keyword_length = 5},
        -- { name = 'cmdline'},
    },
    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end
    },
    formatting = {
        format = require('lspkind').cmp_format({
            with_text = true,
            menu = {
                buffer = '[buf]',
                nvim_lsp = '[LSP]',
                nvim_lua = '[api]',
                path = '[path]',
                luasnip = '[snip]',
            }
        })
    },
    experimental = {
        native_menu = false,
        ghost_text = false,
    }

})
cmp.event:on(
  'confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done()
)
