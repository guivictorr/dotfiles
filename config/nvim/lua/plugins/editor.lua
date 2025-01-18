return {
  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
      {
        'windwp/nvim-autopairs',
        opts = {},
      },
      {
        'windwp/nvim-ts-autotag',
        opts = {},
      },
    },
    opts = {
      sources = {
        default = { 'lsp', 'path', 'buffer' },
      },
      keymap = {
        preset = 'enter',
      },
      completion = {
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= 'cmdline'
          end,
          border = 'rounded',
          winhighlight = 'Normal:NormalFloat,FloatBorder:Normal',
          draw = {
            treesitter = { 'lsp' },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = 'rounded',
          },
        },
        ghost_text = {
          enabled = vim.g.ai_cmp,
        },
      },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    keys = { '<leader>sf', '<leader>sh', '<leader>sg', '<leader>sd', '<leader>sb' },
    dependencies = { 'nvim-lua/plenary.nvim' },
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
      }
      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Files' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search by Grep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Find existing buffers' })
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
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  },
}
