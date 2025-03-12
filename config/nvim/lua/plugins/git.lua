return {
  -- Add Git signs in signcolumn
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    keys = {
      { '<leader>ghr', '<CMD>Gitsigns reset_hunk<CR>', desc = 'Reset Hunk', mode = { 'v', 'n' } },
      { '<leader>ghR', '<CMD>Gitsigns reset_buffer<CR>', desc = 'Reset Buffer', mode = { 'v', 'n' } },
    },
    opts = {},
  },
}
