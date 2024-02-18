local function reveal_file()
  local reveal_file = vim.fn.expand("%:p")
  if reveal_file == "" then
    reveal_file = vim.fn.getcwd()
  else
    local f = io.open(reveal_file, "r")
    if f then
      f.close(f)
    else
      reveal_file = vim.fn.getcwd()
    end
  end

  return reveal_file
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>fe", "<leader>fE", false },
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, position = "float", reveal_file = reveal_file() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    -- {
    --   "<leader>E",
    --   function()
    --     require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd(), position = "float" })
    --   end,
    --   desc = "Explorer NeoTree (cwd)",
    -- },
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
