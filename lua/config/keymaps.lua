-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local defaults = {
    silent = true,
    noremap = true,
  }
  vim.keymap.set(mode, lhs, rhs, vim.tbl_deep_extend("keep", defaults, opts or {}))
end

-- forward and backward
map("i", "<C-f>", "<Right>")
map("i", "<C-b>", "<Left>")

-- easy normal
map("i", "jk", "<Esc>")

-- These are used mostly by the alacritty config to map CMD-<key> to other keymaps
map("n", "<M-S-b>", "<Esc>:Telescope buffers<CR>")
map("n", "<leader>lfd", ":Telescope lsp_references<CR>")
map("n", "<leader>pf", ":Telescope find_files<CR>")
map("n", "<leader>pg", ":Telescope git_status<CR>")

-- kill the buff
map("n", "<leader>k", "<cmd>Bdelete<CR>")
map("n", "<leader>K", "<cmd>clo<CR>")
map("n", "<leader>ps", "<cmd>GrugFar<cr>")
map("n", "<M-S-f>", "<cmd>GrugFar<cr>")

-- Easy start and end
map({ "n", "v" }, "L", "$")
map({ "n", "v" }, "H", "^")

-- I don't want to accidentally close vim
map("n", "<C-z>", ":nohl<CR>")

--- undo
map("n", "<D-z>", ":undo<CR>")
map("i", "<D-z>", "<Esc>:undo<CR>")

-- Saving
map({ "i", "n", "v" }, "<C-S-s>", "<Esc>:w<CR>a", { silent = true })

map("n", "<leader>qa", ":qa!<CR>")

-- Diagnostics
map("n", "<C-e>", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { silent = true })

-- Telescope
map({ "n", "v", "i" }, "\\tbp", "<Esc>:Telescope find_files<CR>")
map({ "n", "v", "i" }, "<C-p>", "<Esc>:Telescope find_files<CR>")
map({ "n", "v", "i" }, "\\tbg", "<Esc>:Telescope git_status<CR>")
map({ "n", "v", "i" }, "\\tbb", "<Esc>:Telescope buffers<CR>")

-- Opening special directories
map("n", "<leader>cop", ":Open ~/.config/nvim/lua<CR>")
map("n", "<leader>mux", ":e ~/.tmux.conf<CR>")
map("n", "<leader>,", ":e ~/.config/nvim/lua/custom/mappings.lua<CR>")
map("n", "<leader>as", ":e ~/.config/kitty/kitty.conf<CR>")

-- Undo
map("n", "\\tbz", "u")
map("i", "\\tbz", "<Esc>xa")

-- Hide search results
map("n", "<C-g>", ":nohl<CR>")

-- use ctrl-c to exit insert mode
map("i", "<C-c>", "<Esc>")

-- Ctrl-c should basically do what esc does in normal
map("n", "<C-c>", "<Esc>")

-- insert mode moving cursor around
map("i", "<C-p>", "<Up>")
map("i", "<C-n>", "<Down>")

-- Resizing splits with shift + option + arrows
map("n", "<S-M-Right>", "<C-w>5<")
map("n", "<S-M-Left>", "<C-w>5>")
map("n", "<S-M-Up>", "<C-w>5+")
map("n", "<S-M-Down>", "<C-w>5-")

-- Show type
map("n", "gh", [[vim.lsp.buf.hover]])

-- Code actions
map("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<M-S-a>", "<cmd>lua vim.lsp.buf.code_action()<CR>")

map("n", "gh", ":lua vim.lsp.buf.hover()<CR>")
map("n", "<leader>tk", ":Telescope keymaps<CR>")
map({ "n", "v" }, "<leader>lgh", ":OpenInGHFileLines<CR>")

-- Quickfix mappings
map("n", "<leader>ck", ":cexpr []<cr>", { desc = "Clear list" })
map("n", "<leader>cc", ":cclose <cr>", { desc = "Close list" })
map("n", "<leader>co", ":copen <cr>", { desc = "Open list" })
map("n", "<leader>cf", ":cfdo %s/", { desc = "Search & Replace" })
map("n", "<leader>cp", ":cprev<cr>zz", { desc = "Prev Item" })
map("n", "<leader>cn", ":cnext<cr>zz", { desc = "Next Item" })

-- indentation
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Tab and shift tab
local opts = { noremap = true, silent = true }
map("n", "<Tab>", ">>", opts)
map("n", "<S-Tab>", "<<", opts)
map("v", "<Tab>", ">gv", opts)
map("v", "<S-Tab>", "<gv", opts)

-- Quickly create new files
map("n", "<leader>nf", ":AdvancedNewFile<CR>", { desc = "Create new file" })

-- Rename the variable under your cursor.
--  Most Language Servers support renaming across files, etc.
map("n", "<leader>rn", vim.lsp.buf.rename)
map("t", "<esc>", [[<C-\><C-n>]])
