return {
    { "catppuccin/nvim",     name = "catppuccin", priority = 1000 },
    { "folke/which-key.nvim" },
    { "numToStr/Comment.nvim", dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" } },
    { "nvim-treesitter/nvim-treesitter" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { 'hrsh7th/nvim-cmp' },
    { "folke/flash.nvim" },
    { "RRethy/vim-illuminate" },
    { 'jesseleite/vim-noh' },
    { "kylechui/nvim-surround", version = "*", event = "VeryLazy" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
    { "folke/trouble.nvim", opts = {}, cmd = "Trouble" },
    { "nvimdev/dashboard-nvim", event = 'VimEnter', dependencies = { {'nvim-tree/nvim-web-devicons'}} },
    { 'akinsho/toggleterm.nvim',  version = "*", config = true },
    { "akinsho/bufferline.nvim",   dependencies = { 'nvim-tree/nvim-web-devicons', 'moll/vim-bbye' } },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { "lewis6991/gitsigns.nvim" },
    { "windwp/nvim-autopairs" },
    { "windwp/nvim-ts-autotag" },
    { "m4xshen/smartcolumn.nvim" },
    { "L3MON4D3/LuaSnip", version = "v2.*", dependencies = { "rafamadriz/friendly-snippets" } },
    { "brenton-leighton/multiple-cursors.nvim", version = "*", opts = {}},
    { "saadparwaiz1/cmp_luasnip" },
    { 'smbl64/vim-black-macchiato' },
    { 'stevearc/conform.nvim' },
    { 'petertriho/nvim-scrollbar' },
    { 'sindrets/diffview.nvim' },
    { 'Wansmer/treesj', keys = { '<space>m' }, dependencies = { 'nvim-treesitter/nvim-treesitter' }},
    { "Exafunction/codeium.nvim", event = 'BufEnter', dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" } },
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
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = '▏' },
            scope = { enabled = false },
            exclude = {
                buftypes = { "terminal" },
                filetypes = { "dashboard" },
            }
        },
    },
    {
        "mfussenegger/nvim-dap", dependencies = {
            {
                "jay-babu/mason-nvim-dap.nvim",
                dependencies = { "nvim-dap" },
                cmd = { "DapInstall", "DapUninstall" },
            },
            { "rcarriga/nvim-dap-ui", dependencies = {"nvim-dap", "nvim-neotest/nvim-nio"} },
            { "rcarriga/cmp-dap", dependencies = { "nvim-cmp"} },
        }
    },
    { "theHamsta/nvim-dap-virtual-text" },
}
