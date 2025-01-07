return {
  "telescope.nvim",
  opts = {
    defaults = {
      pickers = {
        buffers = {
          sort_lastused = true,
        },
      },
      -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      layout_config = {
        width = function(_, max_columns)
          local percentage = 0.7
          local minimum_width = 80
          return math.max(math.floor(percentage * max_columns), minimum_width)
        end,
        height = function(_, _, max_lines)
          local percentage = 0.5
          local min = 40
          return math.max(math.floor(percentage * max_lines), min)
        end,
        prompt_position = "top",
      },
      file_ignore_patterns = {
        "public",
        "ios",
        ".snowsql",
        ".oh-my-zsh",
        "ios",
        ".cache",
      },
      mappings = {
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          ["<esc>"] = require("telescope.actions").close,
        },
      },
    },
  },
}
