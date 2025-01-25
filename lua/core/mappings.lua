-- Common

vim.keymap.set('n', '<leader>w', ":w<cr>", {desc="Save"})
vim.keymap.set('n', '<leader>q', ":confirm q<cr>", {desc="Quit"})
vim.keymap.set('n', '<leader>Q', ":confirm qall<cr>", {desc="Quit all"})
vim.keymap.set('n', '<C-s>', ":w!<cr>", {desc="Force write"})
vim.keymap.set('n', '<C-q>', ":qa!<cr>", {desc="Force quit"})
vim.keymap.set('n', '|', ":vsplit<cr>", {desc="Vertical split"})
vim.keymap.set('n', '\\', ":split<cr>", {desc="Horizontal split"})
vim.keymap.set('n', '<leader>x', ":Bdelete<CR>", {desc="Close buffer"})

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
vim.keymap.set('n', '<leader>bb', ":BufferLinePick<CR>", {desc="Buffer Pick"})

-- Telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc="Find files"})
vim.keymap.set('n', "<leader>fo", builtin.oldfiles, {desc="Old Files"})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {desc="Find words"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc="Find buffers"})
vim.keymap.set('n', '<leader>fc', builtin.grep_string, {desc="Find word under cursor"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc="Help tags"})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {desc="Git branches"})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {desc="Git commits"})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {desc="Git status"})
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {silent = true, desc="Document symbols"})
vim.keymap.set('n', '<leader>lD', builtin.diagnostics, {noremap = true, silent = true, desc="Diagnostics"})
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {noremap = true, silent = true, desc="References"})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {noremap = true, silent = true, desc="Definitions"})

-- LSP
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc="Prev diagnostic"})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc="Next diagnostic"})
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist, {desc="Show list diagnostic's"})
vim.keymap.set('n',"gl", function() vim.diagnostic.open_float() end, {desc = "Hover diagnostics"})

-- Formatting
vim.api.nvim_create_user_command("FormatRuff", function () require('conform').format({formatters={"ruff_format"}}) end, {})
vim.api.nvim_create_user_command("FormatLintErrors", function () require('conform').format({formatters={"ruff_fix"}}) end, {})
vim.api.nvim_create_user_command("FormatImports", function () require('conform').format({formatters={"ruff_organize_imports"}}) end, {})
vim.keymap.set('n', '<leader>lff', ":FormatRuff<CR>", {desc="Format Ruff"})
vim.keymap.set('n', '<leader>lfi', ":FormatImports<CR>", {desc="Format Imports"})
vim.keymap.set('n', '<leader>lfe', ":FormatLintErrors<CR>", {desc="Format Lint Errors"})
vim.keymap.set('n', '<leader>lfd', ":2TermExec cmd=\"ruff check --diff % \" direction=float<CR>", {desc="Format Show Diff"})
-- Black Macchiato
vim.keymap.set('n', '<leader>lfl', ":BlackMacchiato<CR><CR>", {desc="Format line"})
vim.keymap.set('v', '<leader>lfr', ":BlackMacchiato<CR><CR>", {desc="Format range"})
-- vim.keymap.set('n', '<Leader>lF', function() vim.lsp.buf.format { async = true } end, opts) in lsp.lua

-- GitSigns
vim.keymap.set('n', "]g", function() require("gitsigns").next_hunk() end, {desc = "Next hunk"})
vim.keymap.set("n", "[g", function() require("gitsigns").prev_hunk() end, {desc = "Previous hunk"})
vim.keymap.set("n", "<leader>gl", function() require("gitsigns").blame_line() end, {desc = "View blame"})
vim.keymap.set("n", "<leader>gL", function() require("gitsigns").blame_line { full = true } end, {desc = "View full blame"})
vim.keymap.set("n", "<leader>gp", function() require("gitsigns").preview_hunk() end, {desc = "Preview hunk"})
vim.keymap.set("n", "<leader>gs", function() require("gitsigns").stage_hunk() end, {desc = "Stage hunk"})
vim.keymap.set("n", "<leader>gh", function() require("gitsigns").reset_hunk() end, {desc = "Reset hunk"})
vim.keymap.set("n", "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, {desc = "Undo Stage hunk"})
vim.keymap.set("n", "<leader>gb", function() require("gitsigns").stage_buffer() end, {desc = "Stage buffer"})
vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_buffer() end, {desc = "Reset buffer"})
vim.keymap.set("n", "<leader>gd", function() require("gitsigns").diffthis() end, {desc = "View diff"})

-- vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_buffer() end, {desc = "Reset Git buffer"})
--LazyGit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", {desc = "LazyGit", noremap=true, silent=true})


--Trouble
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>",{desc = "Diagnostics (Trouble)"})
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",{desc = "Buffer Diagnostics (Trouble)"})
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>",{desc = "Symbols (Trouble)"})
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>",{desc = "Location List (Trouble)"})
--
--Diffview
vim.keymap.set("n", "<leader>vh", "<cmd>DiffviewFileHistory %<cr>",{desc = "File history"})
vim.keymap.set("n", "<leader>vc", "<cmd>DiffviewClose<cr>", {desc="Diffview Close"})
vim.keymap.set("n", "<leader>vo", "<cmd>DiffviewOpen<cr>",{desc = "Diffview Open"})
vim.keymap.set("n", "<leader>vd", "<cmd>DiffViewOpen origin/develop...HEAD<cr>",{desc = "Diffview develop"})


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
-- in Codeium.lua

-- Multicursor
vim.keymap.set({"n", "i", "x"},"<A-Up>","<Cmd>MultipleCursorsAddUp<CR>", {desc = "Add cursor and move up" })
vim.keymap.set({"n", "i", "x"},"<A-Down>","<Cmd>MultipleCursorsAddDown<CR>",{desc = "Add cursor and move down"})
vim.keymap.set({"n", "i"},"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>",{desc = "Add or remove cursor" })
vim.keymap.set({"n", "x"},"<Leader>a","<Cmd>MultipleCursorsAddMatches<CR>",{desc = "Add cursors to cword"})


-- Dap
vim.keymap.set("n", "<Leader>db","<cmd>lua require'dap'.toggle_breakpoint()<CR>",{desc = "Toggle Breakpoint"})
vim.keymap.set("n", "<Leader>dx","<cmd>lua require'dap'.clear_breakpoints()<CR>",{desc = "Clear breakpoints"})
vim.keymap.set("n", "<Leader>do","<cmd>lua require'dapui'.open()<cr>",{desc = "Open Dap UI"})
vim.keymap.set("n", "<Leader>dc","<cmd>lua require'dapui'.close()<cr>",{desc = "Close Dap UI"})
