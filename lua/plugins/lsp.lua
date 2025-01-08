-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- Sntup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = {buffer = ev.buf}
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<Leader>lR', vim.lsp.buf.rename, opts)
        vim.keymap.set({'n', 'v'}, '<Leader>la', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format {async = true} end, opts) end})


  -- if client.supports_method "textDocument/documentHighlight" then
  --   add_buffer_autocmd("lsp_document_highlight", bufnr, {
  --     {
  --       events = { "CursorHold", "CursorHoldI" },
  --       desc = "highlight references when cursor holds",
  --       callback = function()
  --         if not M.has_capability("textDocument/documentHighlight", { bufnr = bufnr }) then
  --           del_buffer_autocmd("lsp_document_highlight", bufnr)
  --           return
  --         end
  --         vim.lsp.buf.document_highlight()
  --       end,
  --     },
  --     {
  --       events = { "CursorMoved", "CursorMovedI", "BufLeave" },
  --       desc = "clear references when cursor moves",
  --       callback = function() vim.lsp.buf.clear_references() end,
  --     },
  --   })
  -- end
