return {
  -- add gruvbox
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.o.background = "dark"
      vim.g.gruvbox_material_background = "hard"
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
