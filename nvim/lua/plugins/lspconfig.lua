return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      }

      opts.servers.tsserver.handlers = handlers
      opts.servers.lua_ls.handlers = handlers
    end,
  },
}
