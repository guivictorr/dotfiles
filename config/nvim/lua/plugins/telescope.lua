return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      defaults = {
        path_display = {
          "filename_first",
        },
        layout_config = {
          prompt_position = "top",
        },
      },
    },
  },
}
