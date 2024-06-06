local function map(mode, lhs, rhs, opts)
	local defaults = {
		silent = true,
		noremap = true,
	}
	vim.keymap.set(mode, lhs, rhs, vim.tbl_deep_extend("force", defaults, opts or {}))
end

-- forward and backward
map("i", "<C-f>", "<Right>")
map("i", "<C-b>", "<Left>")

-- kill the buff
map("n", "<leader>k", ":Bdelete<CR>")
map("n", "<leader>K", ":clo<CR>")
map("n", "<leader>ps", ":Spectre<CR>")

-- Easy start and end
map({ "n", "v" }, "L", "$")
map({ "n", "v" }, "H", "^")

-- I don't want to accidentally close vim
map("n", "<C-z>", ":nohl<CR>")

--- undo
map("n", "<D-z>", ":undo<CR>")
map("i", "<D-z>", "<Esc>:undo<CR>")

-- Saving
map("n", "<C-s>", ":w<CR>", { silent = true })
map("n", "<leader>s", ":w<CR>")
map("n", "<leader>qa", ":qa<CR>")
map({ "i", "v", "n" }, "<D-s>", "<Esc>:w<CR>")

-- Diagnostics
map("n", "<C-e>", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
map("n", "<C-.>", "<cmd>lua vim.lsp.buf.code_action()<cr>")

-- toggling terminal
map("n", "<C-\\>", ":FloatermToggle<CR>", { desc = "Toggle Floaterm" })
map("v", "<C-\\>", ":FloatermToggle<CR>", { desc = "Toggle Floaterm" })
map("t", "<C-\\>", [[<C-\><C-n>:FloatermToggle<CR>]], { desc = "Close Floaterm" })

map({ "n", "v", "i" }, "<D-p>", "<Esc>:Telescope find_files<CR>")
map({ "n", "v", "i" }, "<D-g>", "<Esc>:Telescope git_status<CR>")
map({ "n", "v", "i" }, "<D-b>", "<Esc>:Telescope buffers<CR>")

map("n", "<leader>,", ":e ~/.config/nvim/lua/braden/mappings.lua<CR>")
map("n", "<leader>as", ":e ~/.config/alacritty/alacritty.toml<CR>")

-- Hide search results
map("n", "<C-g>", ":nohl<CR>")

-- use ctrl-c to exit insert mode
map("i", "<C-c>", "<Esc>")

-- Ctrl-c should basically do what esc does in normal
map("n", "<C-c>", "<Esc>")

-- insert mode moving cursor around
map("i", "<C-p>", "<Up>")
map("i", "<C-n>", "<Down>")

map("n", "<S-M-Left>", "<C-w>5<")
map("n", "<S-M-Right>", "<C-w>5>")
map("n", "<S-M-Up>", "<C-w>5+")
map("n", "<S-M-Down>", "<C-w>5-")

-- Show type
map("n", "gh", [[vim.lsp.buf.hover]])

-- Code actions
map("n", "<leader>.", ":lua vim.lsp.buf.code_action()<CR>")

map({ "n", "v", "i" }, "<D-.>", ":lua vim.lsp.buf.code_action()<CR>")

map("n", "gh", ":lua vim.lsp.buf.hover()<CR>")
map("n", "<C-C>L", "<Nop>")
map("n", "<leader>tk", ":Telescope keymaps<CR>")
map("n", "<D-b>", "<Esc>:Telescope buffers<CR>")
--[[ map('n', '<leader>b', ':Open ~/workspace/crypto/') ]]
map({ "n", "v" }, "<leader>lgh", ":OpenInGHFileLines<CR>")
--[[ map({ 'n', 'v', 'i' }, '<D-S-p>', ':chdir ~/workspace/crypto') ]]

-- Quickfix mappings
map("n", "<leader>ck", ":cexpr []<cr>", { desc = "Clear list" })
map("n", "<leader>cc", ":cclose <cr>", { desc = "Close list" })
map("n", "<leader>co", ":copen <cr>", { desc = "Open list" })
map("n", "<leader>cf", ":cfdo %s/", { desc = "Search & Replace" })
map("n", "<leader>cp", ":cprev<cr>zz", { desc = "Prev Item" })
map("n", "<leader>cn", ":cnext<cr>zz", { desc = "Next Item" })

-- Terminals
map("t", "<C-w>l", [[<C-\><C-n>:FloatermNext<CR>]], { desc = "Next terminal" })
map("t", "<C-w>h", [[<C-\><C-n>:FloatermPrev<CR>]], { desc = "Prev terminal" })
map("t", "<C-w>n", [[<C-\><C-n>:FloatermNew<CR>]], { desc = "New terminal" })
map("t", "<C-w>c", [[<C-\><C-n>:FloatermKill<CR>]], { desc = "Kill current terminal" })
