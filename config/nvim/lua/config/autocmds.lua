-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
api.nvim_set_hl(0, "FloatTitle", { link = "Normal" })
api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
api.nvim_set_hl(0, "NeoTreeNormal", { link = "Normal" })
api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { link = "Normal" })

vim.diagnostic.config({
  float = { border = "rounded" },
})
