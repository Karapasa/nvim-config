return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  { "folke/which-key.nvim" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
   },
   {
     "numToStr/Comment.nvim",
     dependencies = {
     "JoosepAlviste/nvim-ts-context-commentstring",
     }
   }, 
   { "nvim-treesitter/nvim-treesitter" },
   { "neovim/nvim-lspconfig" },

   {'hrsh7th/cmp-nvim-lsp'},
   {'hrsh7th/cmp-buffer'},
   {'hrsh7th/cmp-path'},
   {'hrsh7th/cmp-cmdline'},
   {'hrsh7th/nvim-cmp'},
   {
    "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
   },
   { "williamboman/mason.nvim" },
   { 'nvim-telescope/telescope.nvim', tag='0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
   },
   { "nvimtools/none-ls.nvim" },
   { 
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },
   { "nvimdev/dashboard-nvim" },
   { 'akinsho/toggleterm.nvim', version = "*", config = true},
   { "akinsho/bufferline.nvim", dependencies = {'nvim-tree/nvim-web-devicons', 'moll/vim-bbye'}},
   { 'nvim-lualine/lualine.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},
   { "lewis6991/gitsigns.nvim" },
   { "windwp/nvim-autopairs" },
   { "windwp/nvim-ts-autotag" },
   { "L3MON4D3/LuaSnip", version = "v2.*", dependencies = { "rafamadriz/friendly-snippets" } },
   { "glepnir/dashboard-nvim",
        event = 'VimEnter',
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
   },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
   },
   {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {
        indent = {char = '▏'},
        scope = {enabled = false},
        exclude = {
          buftypes = { "terminal" },
          filetypes = { "dashboard" },
        }
      },
    },
    {
      "m4xshen/smartcolumn.nvim",
      opts = {
        colorcolumn = "120",
        disabled_filetypes = { "help", "dashboard" },
      },
    },
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",  -- Use the latest tagged version
    opts = {},  -- This causes the plugin setup function to be called
    keys = {
      {"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move up"},
      {"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move down"},

      {"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}, desc = "Add or remove cursor"},

      {"<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
      {"<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Jump to next cword"},
    },
  },
  {
    "Exafunction/codeium.nvim",
    event = 'BufEnter',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        vim.keymap.set('i', '<A-i>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true }),
        vim.keymap.set('i', '<A-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true }),
        vim.keymap.set('i', '<A-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true }),
        vim.keymap.set('i', '<A-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true }),
        })
    end
  },
}
