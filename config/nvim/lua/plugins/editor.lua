return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          sorting_strategy = 'ascending', -- Sort results in ascending order
          layout_config = {
            prompt_position = 'top',
          },
        },
        pickers = {
          find_files = {
            theme = 'dropdown',
            previewer = false,
          },
          buffers = {
            theme = 'dropdown',
            previewer = false,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(require('telescope').load_extension, 'ui-select')
      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Files (Cwd)' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search by Grep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Find existing buffers' })
      -- Function to get the root directory

      -- Key mapping for searching in the root folder
      vim.keymap.set('n', '<leader>sF', function()
        builtin.find_files { cwd = require('utils').get_root_dir() }
      end, { desc = 'Search files (Root Folder)' })
      -- Shortcut for searching my dotfiles
      vim.keymap.set('n', '<leader>sc', function()
        builtin.find_files { cwd = '~/dotfiles' }
      end, { desc = 'Search Config' })
    end,
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    keys = {
      { '<leader>e', ':Oil --float<CR>', desc = 'Oil' },
    },
    opts = {
      win_options = {
        signcolumn = 'yes',
      },
      keymaps = {
        ['<C-s>'] = '<CMD>w<CR>',
        ['<C-l>'] = 'actions.select_vsplit',
        ['q'] = 'actions.close',
      },
      float = {
        max_width = 60,
        max_height = 20,
      },
    },
    -- Optional dependencies
    dependencies = { { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font } },
  },
}
