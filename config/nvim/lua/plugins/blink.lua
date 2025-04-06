return {
  -- AutoComplete
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<C-l>"] = { "show", "show_documentation" },
      },
      completion = {
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= "cmdline"
          end,
          border = "rounded",
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = {
            border = "rounded",
          },
        },
        ghost_text = {
          enabled = true,
        },
      },
    },
  },
}
