return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  cond = vim.g.neovide == nil,
  opts = {
    smear_between_neighbor_lines = false,
    hide_target_hack = true,
    cursor_color = "none",
    stiffness = 0.8, -- 0.6      [0, 1]
    trailing_stiffness = 0.5, -- 0.3      [0, 1]
    distance_stop_animating = 0.5, -- 0.1      > 0
  },
}
