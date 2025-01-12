vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.fn.sign_define("DiagnosticSignError",
                   {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
                   {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
                   {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
                   {text = "", texthl = "DiagnosticSignHint"})

require("neo-tree").setup({
  auto_clean_after_session_restore = true,
  close_if_last_window = true,
  enable_git_status = true,
  enable_diagnostics = false,
  sources = { "filesystem", "buffers", "git_status"},
  source_selector = {
    winbar = true,
    content_layout = "center",
    sources = {
      { source = "filesystem", display_name = " " .. "File" },
      { source = "buffers", display_name = "󰈙 " .. "Bufs" },
      { source = "git_status", display_name = "󰊢 " .. "Git" },
      { source = "diagnostics", display_name = "󰒡 " .. "Diagnostic" },
    }
  },

  default_component_configs = {
        indent = { padding = 0 },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
          default = "󰈙",
        },
        modified = { symbol = "" },
        git_status = {
          symbols = {
            added = "",
            deleted = "",
            modified = "",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
    },
    commands = {
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if (node.type == "directory" or node:has_children()) and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" or node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, seleect the next child
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        else -- if not a directory just open it
          state.commands.open(state)
        end
      end,
    },
    window = {
      width = 30,
      mappings = {
        ["<space>"] = false, -- disable space until we figure out which-key disabling
        ["[b"] = "prev_source",
        ["]b"] = "next_source",
        O = "system_open",
        Y = "copy_selector",
        h = "parent_or_close",
        l = "child_or_open",
        o = "open",
      },
      fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
        ["<C-j>"] = "move_cursor_down",
        ["<C-k>"] = "move_cursor_up",
      },
    },

    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = vim.fn.has "win32" ~= 1,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        never_show = {
          "__pycache__",
          ".github",
          ".git",
          ".idea",
          ".pytest_cache",
          ".mypy_cache",
        },
      }
    },

  	event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(_) vim.opt_local.signcolumn = "auto" end,
        },
	},
})
