return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
    { "<leader>fe", ":Neotree toggle left<CR>", silent = true, desc = "Left File Explorer" },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
