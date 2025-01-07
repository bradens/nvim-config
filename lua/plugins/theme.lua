return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      dark_variant = "main",
      extend_background_behind_borders = true,
      groups = {
        border = "highlight_low",
      },
      enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
      },
      highlight_groups = {
        TelescopeBorder = { fg = "highlight_high", bg = "none" },
        TelescopeNormal = { bg = "none" },
        TelescopePromptNormal = { bg = "base" },
        TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        TelescopeSelection = { fg = "text", bg = "base" },
        TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
        NormalFloat = { bg = "none" },
        FloatBorder = { fg = "highlight_med", bg = "none" },
      },
    })

    vim.cmd("colorscheme rose-pine")
  end,
}

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   lazy = false,
--   config = function()
--     require("catppuccin").setup({
--       dim_inactive = {
--         enabled = false, -- dims the background color of inactive window
--         shade = "dark",
--         percentage = 0.15, -- percentage of the shade to apply to the inactive window
--       },
--       background = {
--         light = "mocha",
--         dark = "frappe",
--       },
--     })
--     vim.cmd.colorscheme("catppuccin")
--   end,
-- }
--
-- return {
--   {
--     "folke/tokyonight.nvim",
--     config = function()
--       require("tokyonight").setup({
--         dim_inactive = "true",
--         style = "night",
--         on_colors = function() end,
--         on_highlights = function(hl, c)
--           local prompt = c.bg_popup --  "#e1e2e6"
--           hl.TelescopeNormal = {
--             bg = c.bg_dark,
--             fg = c.fg_dark,
--           }
--           hl.TelescopeBorder = {
--             bg = c.bg_dark,
--             fg = c.bg_dark,
--           }
--           hl.TelescopePromptNormal = {
--             bg = prompt,
--           }
--           hl.TelescopePromptBorder = {
--             bg = prompt,
--             fg = prompt,
--           }
--           hl.TelescopePreviewNormal = {
--             bg = prompt,
--           }
--           hl.TelescopePreviewBorder = {
--             bg = prompt,
--             fg = prompt,
--           }
--           hl.TelescopePromptTitle = {
--             bg = prompt,
--             fg = c.fg_dark,
--           }
--           hl.TelescopePreviewTitle = {
--             bg = prompt,
--             fg = prompt,
--           }
--           hl.TelescopeResultsBorder = {
--             bg = prompt,
--             fg = prompt,
--           }
--           hl.TelescopeResultsTitle = {
--             bg = c.bg_dark,
--             fg = c.fg_dark,
--           }
--         end,
--       })
--     end,
--   },
-- }
