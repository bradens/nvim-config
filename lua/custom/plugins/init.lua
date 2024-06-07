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
			vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
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
			g.floaterm_borderchars = "─│─│╭╮╯╰"
			g.floaterm_opener = "vsplit"
		end,
	},
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				keymaps = {
					["<C-p>"] = false,
					["<C-h>"] = false,
				},
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set({ "n", "v", "i" }, "<C-n>", ":Oil<CR>", { silent = true, desc = "Open parent directory" })
		end,
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- My color scheme
	{ "cocopon/iceberg.vim", priority = 10000 },

	"tpope/vim-surround",
}
