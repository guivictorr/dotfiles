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
  { 'sainnhe/gruvbox-material' },
  {
    'f-person/auto-dark-mode.nvim',
    init = function()
      -- Function to determine if macOS is in dark mode
      local function is_dark_mode()
        local handle = io.popen 'defaults read -g AppleInterfaceStyle 2>/dev/null'
        local result = handle:read '*a'
        handle:close()
        return result:match 'Dark' ~= nil
      end

      -- Set the background based on macOS appearance
      if is_dark_mode() then
        vim.g.gruvbox_material_background = 'hard'
        vim.opt.background = 'dark'
      else
        vim.g.gruvbox_material_background = 'medium'
        vim.g.gruvbox_material_float_style = 'dim'
        vim.opt.background = 'light'
      end
    end,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.g.gruvbox_material_background = 'hard'
        vim.api.nvim_set_option_value('background', 'dark', {})
        vim.cmd 'colorscheme gruvbox-material'
      end,
      set_light_mode = function()
        vim.g.gruvbox_material_background = 'medium'
        vim.g.gruvbox_material_float_style = 'dim'
        vim.api.nvim_set_option_value('background', 'light', {})
        vim.cmd 'colorscheme gruvbox-material'
      end,
    },
  },
}
