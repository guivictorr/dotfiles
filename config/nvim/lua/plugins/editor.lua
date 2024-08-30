return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>cd", "<cmd>Cd<cr>", desc = "Change Directory" },
    },
    opts = {
      preview_opts = "hidden",
      files = {
        no_header_i = true,
      },
      grep = {
        no_header_i = true,
      },
      winopts = {
        backdrop = 100,
        width = 0.40,
      },
    },
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      { "<leader>e", ":Oil --float<CR>", desc = "Oil" },
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
