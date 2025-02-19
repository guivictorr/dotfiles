return {
  -- Better comments
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
  },
  -- Break line in html tags correctly
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  -- Auto close html tags
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    opts = {},
  },
  -- Auto pairs
  { 'echasnovski/mini.pairs', version = '*', opts = {} },
  -- Manage surroundings better like (), [], {}, "", ``.
  {
    'echasnovski/mini.surround',
    version = '*',
    opts = {
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        replace = 'gsr', -- Replace surrounding
      },
    },
  },
}
