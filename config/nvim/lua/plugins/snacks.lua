return {
  -- bunch of tools like picker, dashboard, lazygit, notifications and etc...
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>e", false },
      { "<leader>E", false },
    },
    opts = {
      explorer = { enabled = false },
      terminal = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
      win = {
        backdrop = 100,
        border = "rounded",
      },
      picker = {
        layout = {
          preset = "dropdown",
          preview = false,
          layout = { backdrop = false },
        },
        sources = {
          diagnostics = {
            confirm = function(picker, item, action)
              local formattedText = item.text:match(".+/([^/]+%.lua.+)")
              item.text = formattedText
              Snacks.picker.actions.yank(picker, item, action)
            end,
          },
          files = {
            cmd = "fd",
            args = {
              "--type",
              "f", -- Find only files
              "--hidden", -- Include hidden files (needed for filtering)
              "--exclude",
              ".git", -- Exclude .git folder
              "--ignore-file",
              ".gitignore", -- Use .gitignore rules
            },
          },
        },
      },
      dashboard = {
        sections = {
          { section = "keys", align = "center", gap = 1 },
        },
        preset = {
          keys = {
            {
              action = "<leader>ff",
              key = "f",
              text = {
                { "  Find File", hl = "AccessQual", width = 50 },
                { "[f]", hl = "SnacksDashboardDir" },
              },
            },
            {
              action = "<leader>fc",
              key = "c",
              text = {
                { "  Config", hl = "AccessQual", width = 50 },
                { "[c]", hl = "SnacksDashboardDir" },
              },
            },
            {
              action = "<leader>ql",
              key = "s",
              text = {
                { "  Restore Session", hl = "AccessQual", width = 50 },
                { "[s]", hl = "SnacksDashboardDir" },
              },
            },
            {
              action = "<leader>qq",
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
}
