return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    opts = {},
  },
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
  { 'echasnovski/mini.pairs', version = '*', opts = {} },
  {
    'echasnovski/mini.surround',
    version = '*',
    keys = {
      'gsa',
      'gsd',
      'gsr',
    },
    opts = {
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        replace = 'gsr', -- Replace surrounding
      },
    },
  },
}
