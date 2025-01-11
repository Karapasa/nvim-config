local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
-- Setup language servers.
local lspconfig = require('lspconfig')

lspconfig.pyright.setup {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}
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
-- RUFF
require("lspconfig").ruff.setup({
	capabilities = capabilities,
})
-- Python
require("lspconfig").pyright.setup({
	capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          diagnosticMode = "workspace",
          inlayHints = {
            variableTypes = true,
            functionReturnTypes = true,
          },
        },
      },
    },
})
--
-- Lua
require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
})
--
-- Emmet_ls
require("lspconfig").emmet_ls.setup({
	capabilities = capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = {buffer = ev.buf}
        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<Leader>lR', vim.lsp.buf.rename, opts)
        vim.keymap.set({'n', 'v'}, '<Leader>lA', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<Leader>lF', function() vim.lsp.buf.format {async = true} end, opts)

    end})
