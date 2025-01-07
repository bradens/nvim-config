return {
  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({
        vim.keymap.set({ "n", "v" }, "<C-y>", ":YankyRingHistory<CR>"),
        highlight = {
          on_put = true,
          on_yank = true,
          timer = 100,
        },
      })
    end,
    opts = {
      -- highlight = { timer = 100 },
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      --
    },
  },
}
