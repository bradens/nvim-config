return {
  "alexghergh/nvim-tmux-navigation",
  event = "VeryLazy",
  keys = {
    { "<C-h>", ":NvimTmuxNavigateLeft<CR>" },
    { "<C-j>", ":NvimTmuxNavigateDown<CR>" },
    { "<C-k>", ":NvimTmuxNavigateUp<CR>" },
    { "<C-l>", ":NvimTmuxNavigateRight<CR>" },
    -- { "<C-\\>", ":NvimTmuxNavigateLastActive<CR>" },
  },
  config = function()
    local nvim_tmux_nav = require("nvim-tmux-navigation")
    nvim_tmux_nav.setup({
      disable_when_zoomed = true,
      -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        next = "<C-Space>",
      },
    })
  end,
}
