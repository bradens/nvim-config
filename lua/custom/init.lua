require("custom.mappings")
require("custom.plugins")

local indent = 2
local opt = vim.opt

-- Editor settings
opt.tabstop = indent
opt.backspace = { "eol", "start", "indent" }
opt.clipboard = "unnamedplus"
opt.encoding = "utf-8"
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
opt.syntax = "enable"

-- indention
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = indent
opt.smartindent = true
opt.softtabstop = indent
opt.tabstop = indent

-- search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.wildignore = opt.wildignore + { "*/node_modules/*", "*/.git/*", "*/vendor/*" }
opt.wildmenu = true

-- ui
opt.list = false
opt.listchars = {
	tab = "❘-",
	trail = "·",
	lead = "·",
	extends = "»",
	precedes = "«",
	nbsp = "×",
}
opt.mouse = "a"
opt.number = true
opt.rnu = true
opt.scrolloff = 18
opt.showmode = false
opt.sidescrolloff = 3 -- Lines to scroll horizontally
opt.signcolumn = "yes"
opt.splitbelow = true -- Open new split below
opt.splitright = true -- Open new split to the right
opt.wrap = false

-- backups
opt.backup = false
opt.swapfile = false
opt.writebackup = false

-- autocomplete
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shortmess = opt.shortmess + { c = true }
-- perfomance opt.redrawtime = 1500 opt.timeoutlen = 200 opt.ttimeoutlen = 10 opt.updatetime = 100

-- theme
opt.termguicolors = true

-- vim.cmd([[highlight FloatermBorder guifg=#d2d4de guibg=#1a1b25]])
-- vim.cmd([[highlight TelescopeBorder guifg=#d2d4de guibg=#1a1b25]])
-- vim.cmd([[highlight TelescopePromptBorder guifg=#d2d4de guibg=#1a1b25]])
-- vim.cmd([[highlight TelescopeNormal guifg=#d2d4de guibg=#1a1b25]])
-- vim.cmd([[highlight NormalFloat guifg=#d2d4de guibg=#1a1b25]])

-- Remove the weird ~ characters at the end of the buffer
vim.opt.fillchars = { eob = " " }

vim.api.nvim_create_user_command("Browse", function(opts)
	vim.fn.system({ "open", opts.fargs[1] })
end, { nargs = 1 })

require("barbecue.ui").toggle(true)
