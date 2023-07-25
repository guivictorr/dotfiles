return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        prismals = {},
        ---@type lspconfig.options.tsserver
        tsserver = {
          settings = {
            completions = {
              completeFunctionCalls = false,
            },
          },
        },
      },
    },
  },
}
