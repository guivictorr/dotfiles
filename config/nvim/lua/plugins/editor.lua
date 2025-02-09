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
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    keys = {
      { '<leader>ghr', '<CMD>Gitsigns reset_hunk<CR>', desc = 'Reset Hunk', mode = { 'v', 'n' } },
      { '<leader>ghR', '<CMD>Gitsigns reset_buffer<CR>', desc = 'Reset Buffer', mode = { 'v', 'n' } },
    },
    opts = {},
  },
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
      indent = {
        animate = { enabled = false },
      },
      win = {
        backdrop = 100,
        border = 'rounded',
      },
      picker = {
        layout = { preset = 'select', layout = { backdrop = false } },
        sources = {
          help = {
            layout = { preset = 'default', layout = { border = 'none' } },
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
