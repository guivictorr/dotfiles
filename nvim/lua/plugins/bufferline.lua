return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {

        separator_style = { "", "" },
        indicator = { style = "none" },
        show_tab_indicators = false,
        show_close_icon = false,
        show_buffer_close_icons = false,
        tab_size = 0,
        max_name_length = 25,
        offsets = {
          {
            filetype = "neo-tree",
            text = "  Project",
            highlight = "Directory",
            text_align = "left",
          },
        },
        modified_icon = "",
      },

      highlights = {
        fill = {
          bg = "",
        },
        background = {
          bg = "",
        },
        tab = {
          bg = "",
        },
        tab_close = {
          bg = "",
        },
        tab_separator = {
          fg = {
            attribute = "fg",
            highlight = "Normal",
          },
          bg = "",
        },
        tab_separator_selected = {
          fg = {
            attribute = "fg",
            highlight = "Normal",
          },
          bg = "",
          sp = {
            attribute = "sp",
            highlight = "Normal",
          },
        },
        close_button = {
          bg = "",
          fg = {
            attribute = "fg",
            highlight = "Normal",
          },
        },
        close_button_visible = {
          bg = "",
          fg = {
            attribute = "fg",
            highlight = "Normal",
          },
        },
        close_button_selected = {
          fg = { attribute = "fg", highlight = "StatusLineNonText" },
        },
        buffer_visible = {
          bg = "",
        },
        modified = {
          bg = "",
        },
        modified_visible = {
          bg = "",
        },
        duplicate = {
          fg = {
            attribute = "fg",
            highlight = "Normal",
          },
          bg = "",
        },
        duplicate_visible = {
          fg = {
            attribute = "fg",
            highlight = "Normal",
          },
          bg = "",
        },
        separator = {
          fg = {
            attribute = "fg",
            highlight = "Normal",
          },
          bg = "",
        },
        separator_selected = {
          fg = {
            attribute = "fg",
            highlight = "Normal",
          },
          bg = "",
        },
        separator_visible = {
          fg = {
            attribute = "fg",
            highlight = "Normal",
          },
          bg = "",
        },
        offset_separator = {
          fg = {
            attribute = "fg",
            highlight = "Normal",
          },
          bg = "",
        },
        trunc_marker = {
          fg = {
            attribute = "fg",
            highlight = "Normal",
          },
          bg = "",
        },
      },
    },
  },
}
