return {
	{
		"gbprod/yanky.nvim",

		config = function()
			require("yanky").setup({
				vim.keymap.set({ "n", "v" }, "<C-y>", ":YankyRingHistory<CR>"),
			})
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			--
		},
	},
}
