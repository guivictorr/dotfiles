return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = function(_, opts)
      vim.list_extend(opts.servers, {
        prismals = {},
      })
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     -- add prisma lsp
  --     vim.list_extend(opts.ensure_installed, {
  --       "prismals",
  --     })
  --   end,
  -- },
}
