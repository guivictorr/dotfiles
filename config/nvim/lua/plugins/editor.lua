return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    keys = {
      {
        '<leader>gg',
        function()
          Snacks.lazygit.open()
        end,
        mode = 'n',
        desc = 'LazyGit',
      },
    },
    opts = {
      win = {
        backdrop = 100,
        border = 'rounded',
      },
      notifier = { enabled = true },
      lazygit = { enabled = true },
      dashboard = {
        sections = {
          {
            title = 'Current Directory',
            text = {
              { vim.fn.getcwd():match '([^/]+/[^/]+)$', align = 'center' },
            },
            padding = 1,
          },
          { section = 'keys', align = 'center', gap = 1 },
        },
        preset = {
          keys = {
            {
              action = '<leader>sF',
              key = 'f',
              text = {
                { '  Find File', hl = 'AccessQual', width = 50 },
                { '[f]', hl = 'SnacksDashboardDir' },
              },
            },
            {
              action = '<leader>sc',
              key = 'c',
              text = {
                { '  Config', hl = 'AccessQual', width = 50 },
                { '[c]', hl = 'SnacksDashboardDir' },
              },
            },
            {
              action = '<leader>qq',
              key = 'q',
              text = {
                { '󰩈  Quit', hl = 'AccessQual', width = 50 },
                { '[q]', hl = 'SnacksDashboardDir' },
              },
            },
          },
        },
      },
    },
  },
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
      require('keymaps').telescope(require 'telescope.builtin')
    end,
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    keys = {
      { '<leader>e', ':Oil --float<CR>', desc = 'Explorer' },
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
