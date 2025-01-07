return {
  "tpope/vim-surround",
  "tpope/vim-rhubarb",
  "tpope/vim-repeat",
  "Mohammed-Taher/AdvancedNewFile.nvim",
  {
    "jake-stewart/force-cul.nvim",
    config = function()
      require("force-cul").setup()
    end,
  },
}
