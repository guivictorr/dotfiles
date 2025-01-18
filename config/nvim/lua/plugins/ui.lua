return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'helix',
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        section_separators = { left = ' ', right = ' ' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = { 'snacks_dashboard' } },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            icons_enabled = true,
            icon = '',
            padding = { left = 2, right = 1 },
          },
        },
        lualine_b = {
          { 'filetype', separator = '', padding = { left = 1, right = 1 } },
        },
        lualine_c = {
          {
            'branch',
            padding = { right = 1, left = 1 },
          },
          {
            'diff',
          },
        },
        lualine_x = {
          {
            'diagnostics',
            always_visible = true,
            sections = { 'error', 'hint', 'warn' },
            padding = { right = 1 },
          },
        },
        lualine_y = {
          { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
          { 'location', padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return os.date '%R'
          end,
        },
      },
      extensions = { 'lazy', 'oil' },
    },
  },
}
