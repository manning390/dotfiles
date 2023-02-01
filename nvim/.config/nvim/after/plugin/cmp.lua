local cmp = require('cmp')
cmp.setup({
    mapping = {
        -- ['<C-n>'] = cmp.mapping.select_next_item {behavior = cmp.SelectBehavior.Insert },
        -- ['<C-e>'] = cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Insert },
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        -- ["<C-space>"] = cmp.mapping {
        --     i = cmp.mapping.complete(),
        --     c = function(
        --         _ --[[fallback]]
        --     )
        --         if cmp.visible() then
        --             if not cmp.confirm { select = true } then
        --                 return
        --             end
        --         else
        --             cmp.complete()
        --         end
        --     end,
        -- },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<esc>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
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
