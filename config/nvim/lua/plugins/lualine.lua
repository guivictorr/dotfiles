local icons = {
  clock = " ",
  vim = "",
  git = { added = " ", modified = " ", removed = " ", branch = "" },
  diagnostics = { error = " ", hint = " ", warn = " " },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          component_separators = {},
          section_separators = {},
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              icons_enabled = true,
              icon = icons.vim,
              padding = { left = 2, right = 2 },
            },
          },
          lualine_b = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            {
              LazyVim.lualine.pretty_path(),
            },
          },
          lualine_c = {
            {
              "branch",
              icon = icons.git.branch,
              padding = { right = 1, left = 2 },
            },
            {
              "diff",
              symbols = icons.git,
            },
          },
          lualine_x = {
            {
              "diagnostics",
              always_visible = true,
              sections = { "error", "hint", "warn" },
              symbols = icons.diagnostics,
              padding = { right = 2 },
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return icons.clock .. os.date("%R")
            end,
          },
        },
        extensions = { "lazy" },
      }
    end,
  },
}
