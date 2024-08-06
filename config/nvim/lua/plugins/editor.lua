return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fo", "<cmd>Obsidian<cr>", desc = "Second Brain" },
      { "<leader>sf", "<cmd>SearchFolders<cr>", desc = "Search Folders" },
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
