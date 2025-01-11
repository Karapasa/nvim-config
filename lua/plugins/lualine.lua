-- LSP clients attached to buffer
local clients_lsp = function ()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.buf_get_clients(bufnr)
  if next(clients) == nil then
    return ''
  end

  local c = {}
  for _, client in pairs(clients) do
    if client.name ~= "null-ls" then
        table.insert(c, client.name)
    end
  end
  return '\u{f085} [' .. table.concat(c, '|') .. ']'
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'seoul256',
    component_separators = "|",
    section_separators = "",
    disabled_filetypes = {
      statusline = {"neo-tree", "dashboard", "aerial", "Outline", "trouble"},
      winbar = {},
    },
    ignore_focus = { "neo-tree", "dashboard", "Outline", "aerial", "trouble"},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'diagnostics'},
    lualine_x = {clients_lsp, 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

vim.cmd([[
augroup lualine_augroup
    autocmd!
    autocmd User LspProgressStatusUpdated lua require("lualine").refresh()
augroup END
]])
