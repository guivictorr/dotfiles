local icons = {
  clock = " ",
  vim = "",
  git = { added = " ", modified = " ", removed = " ", branch = "" },
  diagnostics = { error = " ", hint = " ", warn = " " },
}
return {
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = {
            skip = true,
          },
        },
      },
      cmdline = {
        view = "cmdline",
      },
      popupmenu = {
        enabled = false,
      },
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "folke/snacks.nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = {
      win = {
        backdrop = false,
      },
      dashboard = {
        sections = {
          {
            title = "Current Directory",
            text = {
              { vim.fn.getcwd():match("([^/]+/[^/]+)$"), align = "center" },
            },
            padding = 1,
          },
          { section = "keys", align = "center", gap = 1 },
        },
        preset = {
          keys = {
            {
              action = ":lua LazyVim.pick()()",
              key = "f",
              text = {
                { "  Find File", hl = "AccessQual", width = 50 },
                { "[f]", hl = "SnacksDashboardDir" },
              },
            },
            {
              action = ":lua LazyVim.pick.config_files()()",
              key = "c",
              text = {
                { "  Config", hl = "AccessQual", width = 50 },
                { "[c]", hl = "SnacksDashboardDir" },
              },
            },
            {
              action = ":lua require('persistence').load({ last = true })",
              key = "s",
              text = {
                { "  Restore Session", hl = "AccessQual", width = 50 },
                { "[s]", hl = "SnacksDashboardDir" },
              },
            },
            {
              action = ":qa",
              key = "q",
              text = {
                { "󰩈  Quit", hl = "AccessQual", width = 50 },
                { "[q]", hl = "SnacksDashboardDir" },
              },
            },
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          component_separators = {},
          section_separators = {},
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter", "snacks_dashboard" } },
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
