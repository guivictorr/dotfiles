local function read_gitignore()
  local patterns = {}
  local file = io.open('.gitignore', 'r')
  if file then
    for line in file:lines() do
      line = line:gsub('%s+', '') -- Remove spaces
      if line ~= '' and not line:match '^#' then
        -- Convert gitignore-style patterns to Lua patterns
        local pattern = line:gsub('%.', '%%.'):gsub('%*', '.*'):gsub('^/', '^')
        table.insert(patterns, pattern)
      end
    end
    file:close()
  end
  return patterns
end

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
    },
    opts = {
      bufdelete = { enabled = true },
      notifier = { enabled = true },
      lazygit = { enabled = true },
      bigfile = { enabled = true },
      indent = {
        animate = { enabled = false },
      },
      win = {
        backdrop = 100,
        border = 'rounded',
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
            find_command = {
              'fd',
              '--type',
              'f', -- Find only files
              '--hidden', -- Include hidden files (needed for filtering)
              '--exclude',
              '.git', -- Exclude .git folder
              '--ignore-file',
              '.gitignore', -- Use .gitignore rules
            },
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
      view_options = {
        is_hidden_file = function(name)
          local gitignore_patterns = read_gitignore()

          local uv = vim.loop -- Neovim's built-in libuv API
          -- Check if it's a folder
          ---@diagnostic disable-next-line: undefined-field
          local stat = uv.fs_stat(name)
          local is_dir = stat and stat.type == 'directory'

          -- Hide only dotfolders (not dotfiles)
          if is_dir and name:match '^%.' then
            return true
          end

          for _, pattern in ipairs(gitignore_patterns) do
            if name:match(pattern) then
              return true
            end
          end
        end,
      },
    },
    -- Optional dependencies
    dependencies = { { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font } },
  },
}
