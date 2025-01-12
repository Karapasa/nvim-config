require("nvim-autopairs").setup()
require("nvim-surround").setup()
require('gitsigns').setup(
    require("scrollbar.handlers.gitsigns").setup()
)
require("luasnip.loaders.from_vscode").lazy_load()
require("mason").setup()
require("mason-lspconfig").setup()
require("codeium").setup()
require("scrollbar").setup({
  excluded_filetypes = { "terminal", "neo-tree", "dashboard", "aerial", "Outline", "trouble"},
})
require('ts_context_commentstring').setup {
  enable_autocmd = false,
}
require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
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
require("smartcolumn").setup({
    colorcolumn = "120",
    disabled_filetypes = { "help", "dashboard" },
})

require("bufferline").setup {
    options = {
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        max_prefix_length = 30,
        truncate_names = false,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        color_icons = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        mode = 'buffers',
        offsets = {
            {
                filetype = "neo-tree",
                text = "NeoTree",
                separator = "",
                padding = 1
            }
        },
        diagnostics = false,
    }
}
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black", "isort" },
  },
})
require('lint').linters_by_ft = {
  python = {'flake8'},
}

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
