local customColor = {
  attribute = "customColor",
  highlight = "Normal",
}

-- Function to open dashboard
local function open_dashboard()
  vim.cmd("Dashboard")
end

-- Function to close all buffers and open dashboard
local function close_all_buffers_and_open_dashboard()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  for _, buf in ipairs(buffers) do
    vim.cmd("bdelete " .. buf.bufnr)
  end
  -- Open dashboard if there are no more open buffers
  if #vim.fn.getbufinfo({ buflisted = 1 }) == 1 then
    open_dashboard()
  end
end

local function close_buffer_and_open_dashboard()
  local current_buffer_count = #vim.fn.getbufinfo({ buflisted = 1 })
  vim.cmd("bdelete")
  -- Open dashboard if it's the last buffer remaining
  if current_buffer_count == 1 then
    open_dashboard()
  end
end

return {
  {
    enabled = false,
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bP", close_all_buffers_and_open_dashboard, desc = "Close all buffers" },
      { "<leader>bd", close_buffer_and_open_dashboard, desc = "Close buffer" },
    },
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
          bg = customColor,
        },
        background = {
          bg = customColor,
        },
        tab = {
          bg = customColor,
        },
        tab_selected = {
          fg = customColor,
          bg = customColor,
        },
        tab_separator = {
          fg = customColor,
          bg = customColor,
        },
        tab_separator_selected = {
          fg = customColor,
          bg = customColor,
          sp = customColor,
        },
        tab_close = {
          fg = customColor,
          bg = customColor,
        },
        close_button = {
          fg = customColor,
          bg = customColor,
        },
        close_button_visible = {
          fg = customColor,
          bg = customColor,
        },
        close_button_selected = {
          fg = customColor,
          bg = customColor,
        },
        buffer_visible = {
          bg = customColor,
        },
        buffer_selected = {
          fg = customColor,
          bg = customColor,
          bold = true,
          italic = true,
        },
        numbers = {
          fg = customColor,
          bg = customColor,
        },
        numbers_visible = {
          fg = customColor,
          bg = customColor,
        },
        numbers_selected = {
          fg = customColor,
          bg = customColor,
          bold = true,
          italic = true,
        },
        diagnostic = {
          bg = customColor,
        },
        diagnostic_visible = {
          bg = customColor,
        },
        diagnostic_selected = {
          bg = customColor,
          bold = true,
          italic = true,
        },
        hint = {
          sp = customColor,
          bg = customColor,
        },
        hint_visible = {
          bg = customColor,
        },
        hint_selected = {
          bg = customColor,
          sp = customColor,
          bold = true,
          italic = true,
        },
        hint_diagnostic = {
          sp = customColor,
          bg = customColor,
        },
        hint_diagnostic_visible = {
          bg = customColor,
        },
        hint_diagnostic_selected = {
          bg = customColor,
          sp = customColor,
          bold = true,
          italic = true,
        },
        info = {
          sp = customColor,
          bg = customColor,
        },
        info_visible = {
          bg = customColor,
        },
        info_selected = {
          bg = customColor,
          sp = customColor,
          bold = true,
          italic = true,
        },
        info_diagnostic = {
          sp = customColor,
          bg = customColor,
        },
        info_diagnostic_visible = {
          bg = customColor,
        },
        info_diagnostic_selected = {
          bg = customColor,
          sp = customColor,
          bold = true,
          italic = true,
        },
        warning = {
          sp = customColor,
          bg = customColor,
        },
        warning_visible = {
          bg = customColor,
        },
        warning_selected = {
          bg = customColor,
          sp = customColor,
          bold = true,
          italic = true,
        },
        warning_diagnostic = {
          sp = customColor,
          bg = customColor,
        },
        warning_diagnostic_visible = {
          bg = customColor,
        },
        warning_diagnostic_selected = {
          bg = customColor,
          sp = customColor,
          bold = true,
          italic = true,
        },
        error = {
          bg = customColor,
          sp = customColor,
        },
        error_visible = {
          bg = customColor,
        },
        error_selected = {
          bg = customColor,
          sp = customColor,
          bold = true,
          italic = true,
        },
        error_diagnostic = {
          bg = customColor,
          sp = customColor,
        },
        error_diagnostic_visible = {
          bg = customColor,
        },
        error_diagnostic_selected = {
          bg = customColor,
          sp = customColor,
          bold = true,
          italic = true,
        },
        modified = {
          fg = customColor,
          bg = customColor,
        },
        modified_visible = {
          fg = customColor,
          bg = customColor,
        },
        modified_selected = {
          fg = customColor,
          bg = customColor,
        },
        duplicate_selected = {
          fg = customColor,
          bg = customColor,
          italic = true,
        },
        duplicate_visible = {
          fg = customColor,
          bg = customColor,
          italic = true,
        },
        duplicate = {
          fg = customColor,
          bg = customColor,
          italic = true,
        },
        separator_selected = {
          fg = customColor,
          bg = customColor,
        },
        separator_visible = {
          fg = customColor,
          bg = customColor,
        },
        separator = {
          fg = customColor,
          bg = customColor,
        },
        indicator_visible = {
          fg = customColor,
          bg = customColor,
        },
        indicator_selected = {
          fg = customColor,
          bg = customColor,
        },
        pick_selected = {
          fg = customColor,
          bg = customColor,
          bold = true,
          italic = true,
        },
        pick_visible = {
          fg = customColor,
          bg = customColor,
          bold = true,
          italic = true,
        },
        pick = {
          fg = customColor,
          bg = customColor,
          bold = true,
          italic = true,
        },
        offset_separator = {
          fg = customColor,
          bg = customColor,
        },
        trunc_marker = {
          fg = customColor,
          bg = customColor,
        },
      },
    },
  },
}
