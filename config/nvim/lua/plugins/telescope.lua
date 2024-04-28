local actions = require("telescope.actions")
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = " " .. "" .. " ",
        selection_caret = " " .. "" .. " ",
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
            width = 0.4,
            prompt_position = "top",
          },
        },
        git_files = {
          previewer = false,
          hidden = true,
          layout_config = {
            width = 0.4,
            prompt_position = "top",
          },
        },
        lsp_references = {
          show_line = false,
          previewer = true,
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
            width = 0.4,
            prompt_position = "top",
          },
        },
      },
    },
  },
}
