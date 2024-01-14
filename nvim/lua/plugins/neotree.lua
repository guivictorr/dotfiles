return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
    { "<leader>fe", ":Neotree toggle left<CR>", silent = true, desc = "Left File Explorer" },
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
