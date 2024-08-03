return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = {
    config = {
      header = vim.split(string.rep("\n", 12), "\n"),
      center = {
        {
          action = "lua LazyVim.pick()()",
          desc = " Find File",
          icon = " ",
          key = "f",
          icon_hl = "AccessQual",
          key_hl = "AerialGuide",
        },
        {
          action = "lua LazyVim.pick.config_files()()",
          desc = " Config",
          icon = " ",
          key = "c",
          icon_hl = "AccessQual",
          key_hl = "AerialGuide",
        },
        {
          action = 'lua require("persistence").load()',
          desc = " Restore Session",
          icon = " ",
          key = "s",
          icon_hl = "AccessQual",
          key_hl = "AerialGuide",
        },
        {
          action = function()
            vim.api.nvim_input("<cmd>qa<cr>")
          end,
          desc = " Quit",
          icon = "󰩈 ",
          icon_hl = "AccessQual",
          key = "q",
          key_hl = "AerialGuide",
        },
      },
      footer = {},
    },
  },
}
