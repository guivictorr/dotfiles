return {
  -- bunch of tools like picker, dashboard, lazygit, notifications and etc...
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
      {
        '<leader>bd',
        function()
          Snacks.bufdelete.delete()
        end,
        mode = 'n',
        desc = 'Buffer Delete',
      },
      {
        '<leader>qq',
        function()
          Snacks.bufdelete.all()
          vim.cmd [[qa]]
        end,
        mode = 'n',
        desc = 'Confirm Quit',
      },
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = 'Search Help',
      },
      {
        '<leader>sF',
        function()
          Snacks.picker.files { cwd = require('utils').get_root_dir() }
        end,
        desc = 'Search Files',
      },
      {
        '<leader>sf',
        function()
          Snacks.picker.files()
        end,
        desc = 'Search Files',
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Search Grep',
      },
      {
        '<leader>sc',
        function()
          Snacks.picker.files { cwd = '~/dotfiles' }
        end,
        desc = 'Search Config',
      },
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = 'Search Diagnostics',
      },
      {
        '<leader>sH',
        function()
          Snacks.picker.highlights()
        end,
        desc = 'Search Highlights',
      },
      -- LSP
      {
        'gd',
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = 'Goto Definition',
      },
      {
        'gr',
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = 'Goto References',
      },
      {
        '<leader>ss',
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = 'Search Symbols',
      },
      {
        '<leader>sS',
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = 'Search Workspace Symbols',
      },
    },
    opts = {
      bufdelete = { enabled = true },
      notifier = { enabled = true },
      lazygit = { enabled = true },
      bigfile = { enabled = true },
      win = {
        backdrop = 100,
        border = 'rounded',
      },
      picker = {
        layout = { preset = 'dropdown', preview = false, layout = { backdrop = false } },
        sources = {
          help = {
            layout = { preset = 'default', preview = true, layout = { border = 'none' } },
            confirm = function(picker)
              picker:action 'focus_preview'
            end,
          },
          diagnostics = {
            confirm = function(picker)
              picker:action 'yank'
              picker:close()
              print 'Diagnostic message copied.'
            end,
          },
          files = {
            cmd = 'fd',
            args = {
              '--type',
              'f', -- Find only files
              '--hidden', -- Include hidden files (needed for filtering)
              '--exclude',
              '.git', -- Exclude .git folder
              '--ignore-file',
              '.gitignore', -- Use .gitignore rules
            },
          },
        },
      },
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
}
