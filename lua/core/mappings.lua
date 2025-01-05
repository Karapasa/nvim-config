-- Common


vim.keymap.set('n', '<leader>w', ":w<cr>", {desc="Save"}) 
vim.keymap.set('n', '<leader>q', ":confirm q<cr>", {desc="Quit"}) 
vim.keymap.set('n', '<leader>Q', ":confirm qall<cr>", {desc="Quit all"}) 
vim.keymap.set('n', '<C-s>', ":w!<cr>", {desc="Force write"}) 
vim.keymap.set('n', '<C-q>', ":qa!<cr>", {desc="Force quit"}) 
vim.keymap.set('n', '|', ":vsplit<cr>", {desc="Vertical split"}) 
vim.keymap.set('n', '\\', ":split<cr>", {desc="Horizontal split"}) 

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
vim.keymap.set('n', '<leader>/', '<esc><cmd>lua require("Comment.api").toggle.linewise()<cr>')
vim.keymap.set('v', '<leader>/', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>')
	
-- Navigate tabs
vim.keymap.set('n', ']t', function() vim.cmd.tabnext() end, {desc="Next Tab"})
vim.keymap.set('n', '[t', function() vim.cmd.tabprevious() end, {desc="Previous Tab"})

-- GitSigns
vim.keymap.set('n', "]g", function() require("gitsigns").next_hunk() end, {desc = "Next Git hunk"})
vim.keymap.set("n", "[g", function() require("gitsigns").prev_hunk() end, {desc = "Previous Git hunk"})
vim.keymap.set("n", "<leader>gl", function() require("gitsigns").blame_line() end, {desc = "View Git blame"})
vim.keymap.set("n", "<leader>gL", function() require("gitsigns").blame_line { full = true } end, {desc = "View full Git blame"})
vim.keymap.set("n", "<leader>gp", function() require("gitsigns").preview_hunk() end, {desc = "Preview Git hunk"})
vim.keymap.set("n", "<leader>gh", function() require("gitsigns").reset_hunk() end, {desc = "Reset Git hunk"})
vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_buffer() end, {desc = "Reset Git buffer"})
vim.keymap.set("n", "<leader>gs", function() require("gitsigns").stage_hunk() end, {desc = "Stage Git hunk"})
vim.keymap.set("n", "<leader>gS", function() require("gitsigns").stage_buffer() end, {desc = "Stage Git buffer"})
vim.keymap.set("n", "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, {desc = "Unstage Git hunk"})
vim.keymap.set("n", "<leader>gd", function() require("gitsigns").diffthis() end, {desc = "View Git diff"})
vim.keymap.set("n", "<leader>gg", function()
                                    local worktree = require("astronvim.utils.git").file_worktree()
                                    local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
                                    utils.toggle_term_cmd("lazygit " .. flags)
                                  end, {desc = "ToggleTerm lazygit"})

-- SymbolsOutline
vim.keymap.set("n", "<leader>lS", function() require("aerial").toggle() end, {desc = "Symbols outline"})

local opts = {noremap=true, silent=true}

vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)
-- Move text up and down
vim.api.nvim_set_keymap("v", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)
-- Visual Block --
-- Move text up and down
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
