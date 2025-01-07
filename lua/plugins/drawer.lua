return {
  {
    enabled = false,
    "mikew/nvim-drawer",
    config = function(_, opts)
      local drawer = require("nvim-drawer")
      vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
        pattern = { "*" },
        callback = function()
          if vim.opt.buftype:get() == "terminal" then
            vim.cmd(":startinsert")
          end
        end,
      })

      drawer.setup({

        drawer.create_drawer({
          size = 15,
          position = "below",

          -- Automatically claim any opened terminals.
          does_own_buffer = function(context)
            return context.bufname:match("term://") ~= nil
          end,

          on_vim_enter = function(event)
            -- Open the drawer on startup.
            event.instance.open({
              focus = false,
            })

            -- Example keymaps:
            -- C-\: focus the drawer.
            -- C-z: zoom the drawer
            vim.keymap.set("n", "<C-\\>", function()
              event.instance.focus_or_toggle()
            end)
            vim.keymap.set("t", "<C-\\>", function()
              event.instance.focus_or_toggle()
            end)
            -- vim.keymap.set("n", "<leader>tn", function()
            -- 	event.instance.open({ mode = "new" })
            -- end)
            -- vim.keymap.set("n", "<leader>tt", function()
            -- 	event.instance.go(1)
            -- end)
            -- vim.keymap.set("n", "<leader>tT", function()
            -- 	event.instance.go(-1)
            -- end)
            vim.keymap.set({ "t", "n" }, "<leader>z", function()
              event.instance.toggle_zoom()
            end)
          end,

          -- When a new buffer is created, switch it to a terminal.
          on_did_create_buffer = function()
            vim.fn.termopen(os.getenv("SHELL"))
          end,

          -- Remove some UI elements.
          on_did_open_buffer = function()
            vim.opt_local.number = false
            vim.opt_local.signcolumn = "no"
            vim.opt_local.statuscolumn = ""
            vim.opt.relativenumber = false
          end,

          -- Scroll to the end when changing tabs.
          on_did_open = function()
            vim.cmd("$")
          end,
        }),
      })

      -- See usage and examples below.
    end,
  },
}
