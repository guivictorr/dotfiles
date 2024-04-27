local actions = require("telescope.actions")

local function getParentFolder(filePath)
  return string.match(filePath, ".*/([^/]+)/[^/]+$")
end

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
        path_display = function(_, path)
          local tail = require("telescope.utils").path_tail(path)
          local parentFolder = getParentFolder(path)

          if tail == "page.tsx" then
            return string.format("%s (%s)", parentFolder, parentFolder .. "/" .. tail)
          end

          return string.format("%s (%s)", tail, parentFolder .. "/" .. tail)
        end,
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
              ["<leader>bd"] = actions.delete_buffer,
            },
            n = {
              ["<leader>bd"] = actions.delete_buffer,
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
