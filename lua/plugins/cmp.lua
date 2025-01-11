local cmp = require 'cmp'


cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {"i", "s"})
    }),
    formatting = {
        fields = {"abbr", "kind", "menu"},
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s', vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "[Lsp]",
                luasnip = "[Snip]",
                buffer = "[File]",
                path = "[Path]",
            })[entry.source.name]

            return vim_item
        end
    },
    sources = {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
    },
})
    -- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['pyright'].setup {capabilities = capabilities}
