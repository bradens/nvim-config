return {
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {},
	},
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("nvim-navic").setup({
				highlight = true,
				lsp = {
					auto_attach = true,
					preference = { "typescript-tools" },
				},
				click = true,
				depth_limit = 0,
				depth_limit_indicator = "..",
				icons = {
					File = " ",
					Module = " ",
					Namespace = " ",
					Package = " ",
					Class = " ",
					Method = " ",
					Property = " ",
					Field = " ",
					Constructor = " ",
					Enum = " ",
					Interface = " ",
					Function = " ",
					Variable = " ",
					Constant = " ",
					String = " ",
					Number = " ",
					Boolean = " ",
					Array = " ",
					Object = " ",
					Key = " ",
					Null = " ",
					EnumMember = " ",
					Struct = " ",
					Event = " ",
					Operator = " ",
					TypeParameter = " ",
				},
			})
		end,
	},
	{
		"famiu/bufdelete.nvim",
		lazy = false,
	},
	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
		end,
	},
	{
		"ggandor/flit.nvim",
		keys = function()
			local ret = {}
			for _, key in ipairs({ "f", "F", "t", "T" }) do
				ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
			end
			return ret
		end,
		opts = { labeled_modes = "nx" },
	},
	{
		"tpope/vim-fugitive",
		cmd = "Git",
		lazy = false,
	},
	{
		"ggandor/leap.nvim",
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		config = function()
			local config = {
				presets = {
					lsp_doc_border = true,
					long_message_to_split = true,
				},
				messages = {
					enabled = false,
					border = {
						enabled = false,
					},
				},
				notify = {
					enabled = false,
				},
				views = {
					notify = {
						merge = true,
					},
				},
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					hover = {
						enabled = true,
					},
					signature = {
						enabled = true,
					},
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
			}

			require("noice").setup(config)

			--[[ map('n', '<c-j>', function() ]]
			--[[   if not require('noice.lsp').scroll(4) then ]]
			--[[     return '<c-j>' ]]
			--[[   end ]]
			--[[ end) ]]
			--[[]]
			--[[ map('n', '<c-k>', function() ]]
			--[[   if not require('noice.lsp').scroll(-4) then ]]
			--[[     return '<c-k>' ]]
			--[[   end ]]
			--[[ end) ]]
		end,

		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"alexghergh/nvim-tmux-navigation",
		lazy = false,
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")
			nvim_tmux_nav.setup({
				disable_when_zoomed = false, -- defaults to false
			})
			vim.keymap.set({ "n", "v" }, "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set({ "n", "v" }, "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set({ "n", "v" }, "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set({ "n", "v" }, "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
		end,
	},
	{
		"bradens/opener.nvim",
		lazy = false,
		config = function()
			require("opener").setup({
				vim.keymap.set(
					"n",
					"<leader>bb",
					":Telescope opener hidden=false max_depth=2 respect_gitignore=true root_dir=~/workspace<CR>"
				),
			})
		end,
	},
	{ "nvim-pack/nvim-spectre", lazy = false },
	{
		"voldikss/vim-floaterm",
		cmd = { "FloatermToggle", "FloatermNew" },
		config = function()
			local g = vim.g
			local title = vim.env.SHELL

			g.floaterm_width = 0.7
			g.floaterm_height = 0.8
			g.floaterm_title = "[" .. title .. "]:($1/$2)"
			g.floaterm_borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
			-- g.floaterm_borderchars = "─│─│╭╮╯╰"
			g.floaterm_opener = "vsplit"
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				-- popup_border_style = "rounded",
				enable_diagnostics = false,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
				},
				buffers = {
					follow_current_file = {
						enabled = true, -- This will find and focus the file in the active buffer every time
						--              -- the current file is changed while the tree is open.
						leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
					},
				},
				filesystem = {
					follow_current_file = {
						enabled = true, -- This will find and focus the file in the active buffer every time
						--               -- the current file is changed while the tree is open.
						leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
					},
				},
			})

			vim.keymap.set({ "n", "v", "i" }, "<C-n>", ":Neotree toggle<CR>", { silent = true })
		end,
	},
	-- {
	-- 	"stevearc/oil.nvim",
	-- 	config = function()
	-- 		require("oil").setup({
	-- 			keymaps = {
	-- 				["<C-p>"] = false,
	-- 				["<C-h>"] = false,
	-- 				["<C-l>"] = false,
	-- 				["<C-j>"] = false,
	-- 				["<C-k>"] = false,
	-- 			},
	-- 			view_options = {
	-- 				show_hidden = true,
	-- 			},
	-- 		})
	-- 		vim.keymap.set({ "n", "v", "i" }, "<C-n>", ":Oil<CR>", { silent = true, desc = "Open parent directory" })
	-- 	end,
	-- 	-- Optional dependencies
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- },
	"tpope/vim-surround",
	"tpope/vim-rhubarb",
	{
		"vim-test/vim-test",
		config = function()
			vim.keymap.set({ "n", "v" }, "<Leader>t", ":TestNearest<CR>", { silent = true, desc = "Run nearest test" })
			vim.g["test#strategy"] = "neovim_sticky"
			vim.g["test#neovim#start_normal"] = 1
			vim.g["test#neovim#term_position"] = "vert 100"
			vim.g["test#neovim_sticky#kill_previous"] = 1 -- Try to abort previous run
			vim.g["test#preserve_screen"] = 0 -- Clear screen from previous run
			vim.g["test#neovim_sticky#reopen_window"] = 1 -- Reopen terminal split if not visible
		end,
	},
	"metakirby5/codi.vim",
	-- {
	-- 	"cormacrelf/dark-notify",
	-- 	config = function()
	-- 		require("dark_notify").run({
	-- 			dark = "tokyonight-night",
	-- 			light = "tokyonight-day",
	-- 			onchange = function(mode)
	-- 				if mode == "dark" then
	-- 					vim.cmd([[colorscheme tokyonight-night]])
	-- 					vim.cmd([[highlight FloatermBorder guifg=#d2d4de guibg=#1a1b25]])
	-- 					vim.cmd([[highlight TelescopeBorder guifg=#d2d4de guibg=#1a1b25]])
	-- 					vim.cmd([[highlight TelescopePromptBorder guifg=#d2d4de guibg=#1a1b25]])
	-- 					vim.cmd([[highlight TelescopeNormal guifg=#d2d4de guibg=#1a1b25]])
	-- 					vim.cmd([[highlight NormalFloat guifg=#d2d4de guibg=#1a1b25]])
	-- 				else
	-- 					vim.cmd([[highlight FloatermBorder guibg=#e1e2e7]])
	-- 					vim.cmd([[highlight TelescopeBorder guibg=#e1e2e7]])
	-- 					vim.cmd([[highlight TelescopePromptBorder guibg=#e1e2e7]])
	-- 					vim.cmd([[highlight TelescopeNormal guibg=#e1e2e7]])
	-- 					vim.cmd([[highlight NormalFloat guibg=#e1e2e7]])
	-- 				end
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	{
		"tpope/vim-repeat",
		lazy = false,
	},
	{
		"TaDaa/vimade",
		config = function()
			vim.g.vimade = {
				enabletreesitter = 1,
				fadelevel = 0.5,
				enablesigns = 1,
			}
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = {
			"echasnovski/mini.icons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
	},
	{
		"Mohammed-Taher/AdvancedNewFile.nvim",
	},
}
