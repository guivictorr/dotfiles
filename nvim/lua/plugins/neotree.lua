return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>fe", ":Neotree toggle left<CR>", silent = true, desc = "Left File Explorer" },
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          dir = vim.loop.cwd(),
          position = "float",
          reveal_force_cwd = true,
        })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
  },
  opts = {
    popup_border_style = "rounded",
    window = {
      position = "right",
      width = 36,
    },
    default_component_configs = {
      indent = {
        last_indent_marker = "╰",
      },
      icon = {
        folder_closed = "󰉋",
        folder_open = "󰝰",
        folder_empty = "󰉖",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "✖", -- this can only be used in the git_status source
          renamed = "󰏫", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "󱃓",
          unstaged = "󰝦",
          staged = "󰄴",
          conflict = "",
        },
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
