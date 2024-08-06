return {
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
}
