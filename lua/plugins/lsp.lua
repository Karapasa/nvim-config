local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end


local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
        active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

--
--
-- CSS
require("lspconfig").cssls.setup({
    capabilities = capabilities,
})
-- HTML
require("lspconfig").html.setup({
    capabilities = capabilities,
})
-- JSON
require("lspconfig").jsonls.setup({
    capabilities = capabilities,
})
-- Python
require("lspconfig").pyright.setup({
    capabilities = capabilities,
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                typeCheckingMode = "basic",
                diagnosticMode = "workspace",
                -- ignore = { '*' },
            },
        },
    },
})
-- -- Ruff
-- require("lspconfig").ruff.setup({
--     capabilities = capabilities,
-- })
-- Lua
require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
})
-- Emmet_ls
require("lspconfig").emmet_ls.setup({
    capabilities = capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { buffer=ev.buf, desc="Declaration"})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer=ev.buf, desc="Signature help"})
        vim.keymap.set('n', '<Leader>lR', vim.lsp.buf.rename, { buffer=ev.buf, desc="Rename"})
        vim.keymap.set({ 'n', 'v' }, '<Leader>lA', vim.lsp.buf.code_action, { buffer=ev.buf, desc="Code Actions"})
        vim.keymap.set('n', '<Leader>lF', function() vim.lsp.buf.format { async = true } end, { buffer=ev.buf, desc="Lsp Format"})
    end
})
