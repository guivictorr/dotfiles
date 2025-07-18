return {
  -- bunch of tools like picker, dashboard, lazygit, notifications and etc...
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>e", false },
      { "<leader>E", false },
      {
        "<leader>sP",
        function()
          Snacks.picker.projects({
            dev = { "~/www" },
          })
        end,
      },
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
        layout = "my_layout",
        layouts = {
          my_layout = {
            layout = {
              box = "vertical",
              width = 0.4,
              height = 0.9,
              border = "none",
              backdrop = 100,
              { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
              { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
            },
          },
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
              action = "<leader>sP",
              key = "p",
              text = {
                { "  Find Projects", hl = "AccessQual", width = 50 },
                { "[p]", hl = "SnacksDashboardDir" },
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
                { "  Restore Session", hl = "AccessQual", width = 50 },
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
