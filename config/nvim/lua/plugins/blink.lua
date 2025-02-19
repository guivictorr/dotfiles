return {
  -- AutoComplete
  {
    'saghen/blink.cmp',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'enter',
        ['<C-l>'] = { 'show', 'show_documentation' },
      },
      completion = {
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= 'cmdline'
          end,
          border = 'rounded',
          winhighlight = 'Normal:NormalFloat,FloatBorder:Normal',
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = {
            border = 'rounded',
          },
        },
        ghost_text = {
          enabled = true,
        },
      },
    },
  },
}
