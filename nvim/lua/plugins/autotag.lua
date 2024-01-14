return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local lspconfig = require("lspconfig")

      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      }

      lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
        handlers = handlers,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      enable_close_on_slash = false,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
  },
}
