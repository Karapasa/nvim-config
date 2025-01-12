-- Common

vim.keymap.set('n', '<leader>w', ":w<cr>", {desc="Save"}) 
vim.keymap.set('n', '<leader>q', ":confirm q<cr>", {desc="Quit"}) 
vim.keymap.set('n', '<leader>Q', ":confirm qall<cr>", {desc="Quit all"}) 
vim.keymap.set('n', '<C-s>', ":w!<cr>", {desc="Force write"}) 
vim.keymap.set('n', '<C-q>', ":qa!<cr>", {desc="Force quit"}) 
vim.keymap.set('n', '|', ":vsplit<cr>", {desc="Vertical split"}) 
vim.keymap.set('n', '\\', ":split<cr>", {desc="Horizontal split"}) 

-- Flash
vim.keymap.set({"n","x","o"}, "s", function() require("flash").jump() end, {desc = "Flash"})

-- NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {desc="Neotree toggle"})
vim.keymap.set('n', '<leader>o', function()
	if vim.bo.filetype == "neo-tree" then
	    vim.cmd.wincmd "p"
	else
	    vim.cmd.Neotree "focus"
	end
end, {desc="Neotree focus"})

-- Comment
vim.keymap.set('n', '<leader>/', '<esc><cmd>lua require("Comment.api").toggle.linewise()<cr>', {desc="Comment"})
vim.keymap.set('v', '<leader>/', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>', {desc="Comment"})
	
-- Navigate tabs
vim.keymap.set('n', '<Tab>', ":bnext<CR>", {desc="Next Tab"})
vim.keymap.set('n', '<S-Tab>', ":bprev<CR>", {desc="Prev Tab"})
vim.keymap.set('n', '<leader>bk', ":BufferLineMoveNext<CR>", {desc="Move Right Tab"})
vim.keymap.set('n', '<leader>bj', ":BufferLineMovePrev<CR>", {desc="Move left Tab"})
vim.keymap.set('n', '<leader>bb', ":BufferLinePick<CR>", {desc="Move left Tab"})

-- Telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', "<leader>fo", builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fc', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {silent = true})
vim.keymap.set('n', '<leader>lD', builtin.diagnostics, {noremap = true, silent = true})
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {noremap = true, silent = true})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {noremap = true, silent = true})

-- LSP
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)
vim.keymap.set('n',"gl", function() vim.diagnostic.open_float() end, {desc = "Hover diagnostics"})

-- Formatting
vim.api.nvim_create_user_command("Format", function () require('conform').format() end, {})
vim.api.nvim_create_user_command("FormatImports", function () require('conform').format({formatters={"isort"}}) end, {})
vim.keymap.set('n', '<leader>lf', ":Format<CR>", {desc="Format"})
vim.keymap.set('n', '<leader>lfi', ":FormatImports<CR>", {desc="Format Imports"})
-- Black Macchiato
vim.keymap.set('n', '<leader>lfl', ":BlackMacchiato<CR><CR>", {desc="Format line"})
vim.keymap.set('v', '<leader>lfr', ":BlackMacchiato<CR><CR>", {desc="Format range"})
-- vim.keymap.set('n', '<Leader>lF', function() vim.lsp.buf.format { async = true } end, opts) in lsp.lua

-- GitSigns
vim.keymap.set('n', "]g", function() require("gitsigns").next_hunk() end, {desc = "Next Git hunk"})
vim.keymap.set("n", "[g", function() require("gitsigns").prev_hunk() end, {desc = "Previous Git hunk"})
vim.keymap.set("n", "<leader>gl", function() require("gitsigns").blame_line() end, {desc = "View Git blame"})
vim.keymap.set("n", "<leader>gL", function() require("gitsigns").blame_line { full = true } end, {desc = "View full Git blame"})
vim.keymap.set("n", "<leader>gp", function() require("gitsigns").preview_hunk() end, {desc = "Preview Git hunk"})
vim.keymap.set("n", "<leader>gh", function() require("gitsigns").reset_hunk() end, {desc = "Reset Git hunk"})
vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_buffer() end, {desc = "Reset Git buffer"})
vim.keymap.set("n", "<leader>gd", function() require("gitsigns").diffthis() end, {desc = "View Git diff"})

--LazyGit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", {desc = "LazyGit"})


--Trouble
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>",{desc = "Diagnostics (Trouble)"})
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",{desc = "Buffer Diagnostics (Trouble)"})
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",{desc = "Symbols (Trouble)"})
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>",{desc = "Location List (Trouble)"})


-- Visual Block --
-- Moving text
local opts = {noremap=true, silent=true}
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)
vim.api.nvim_set_keymap("v", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Improved Terminal Navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>wincmd h<cr>", {desc="Terminal left window navigation"})
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>wincmd j<cr>", {desc="Terminal down window navigation"})
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>wincmd k<cr>", {desc="Terminal up window navigation"})
vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>wincmd l<cr>", {desc="Terminal right window navigation"})

-- Codeium
vim.keymap.set('i', '<A-i>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<A-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<A-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set('i', '<A-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })


-- Multicursor
vim.keymap.set({"n", "i", "x"},"<C-Up>","<Cmd>MultipleCursorsAddUp<CR>", {desc = "Add cursor and move up" })
vim.keymap.set({"n", "i", "x"},"<C-Down>","<Cmd>MultipleCursorsAddDown<CR>",{desc = "Add cursor and move down"})
vim.keymap.set({"n", "i"},"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>",{desc = "Add or remove cursor" })
vim.keymap.set({"n", "x"},"<Leader>a","<Cmd>MultipleCursorsAddMatches<CR>",{desc = "Add cursors to cword"})
