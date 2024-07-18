return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      { "<leader>e", ":Oil --float<CR>", silent = true, desc = "Oil" },
    },
    opts = {
      keymaps = {
        ["<C-s>"] = "<CMD>w<CR>",
        ["<C-l>"] = "actions.select_vsplit",
        ["q"] = "actions.close",
      },
      view_options = {
        show_hidden = false,
      },
      float = {
        max_width = 60,
        max_height = 20,
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" },
  },
}
