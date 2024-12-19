return {
  { "sainnhe/gruvbox-material" },
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 9999,
    init = function()
      -- Function to determine if macOS is in dark mode
      local function is_dark_mode()
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        local result = handle:read("*a")
        handle:close()
        return result:match("Dark") ~= nil
      end

      -- Set the background based on macOS appearance
      if is_dark_mode() then
        vim.opt.background = "dark"
      else
        vim.opt.background = "light"
      end
    end,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.g.gruvbox_material_background = "hard"
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.cmd("colorscheme gruvbox-material")
      end,
      set_light_mode = function()
        vim.g.gruvbox_material_background = "medium"
        vim.g.gruvbox_material_float_style = "dim"
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd("colorscheme gruvbox-material")
      end,
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
