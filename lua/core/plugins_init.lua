
require("nvim-autopairs").setup {}
require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})

require("bufferline").setup {
    options = {
        numbers = "none",
        buffer_close_icon = 'x',
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        max_name_length = 30,
        
        mode = 'buffers',
        offsets = {
            {
                filetype = "neo-tree",
                text = "NeoTree",
                separator = "",
                padding = 0
            }
        },
        diagnostics = false,
        indicator = {
            icon = '',
            style = 'icon'
        },
    }
}
require('ts_context_commentstring').setup {
  enable_autocmd = false,
}
require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
require('gitsigns').setup()
require("luasnip.loaders.from_vscode").lazy_load()
require("mason").setup()
require("mason-lspconfig").setup()

require('lint').linters_by_ft = {
  python = {'flake8'},
}
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "ruff" },
  },
})

require('telescope').setup({
    defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
    }
})

require("toggleterm").setup {open_mapping = [[<F10>]]}
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
