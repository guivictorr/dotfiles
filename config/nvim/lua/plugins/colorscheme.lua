return {
  {
    "sainnhe/gruvbox-material",
  },
  {
    "f-person/auto-dark-mode.nvim",
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
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
