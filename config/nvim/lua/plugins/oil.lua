return {
  {
    "stevearc/oil.nvim",
    keys = {
      { "<leader>e", ":Oil --float<CR>", silent = true, desc = "Oil" },
    },
    opts = {
      keymaps = {
        ["<C-s>"] = "<CMD>w<CR>",
        ["<esc>"] = "actions.close",
        ["q"] = "actions.close",
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        max_width = 100,
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
