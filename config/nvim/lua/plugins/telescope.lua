local actions = require("telescope.actions")
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>uC", false },
    },
    opts = {
      defaults = {
        prompt_prefix = " " .. "" .. " ",
        selection_caret = "" .. " ",
        sorting_strategy = "ascending",
        previewer = false,
        layout_config = {
          prompt_position = "top",
        },
        path_display = {
          "filename_first",
        },
      },

      pickers = {
        find_files = {
          previewer = false,
          hidden = true,
          layout_config = {
            prompt_position = "top",
            width = 60,
          },
        },
        git_files = {
          previewer = false,
          hidden = true,
          layout_config = {
            prompt_position = "top",
            width = 60,
          },
        },
        buffers = {
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer,
            },
            n = {
              ["<c-d>"] = actions.delete_buffer,
            },
          },
          previewer = false,
          initial_mode = "normal",
          layout_config = {
            height = 0.4,
            width = 60,
            prompt_position = "top",
          },
        },
      },
    },
  },
}
