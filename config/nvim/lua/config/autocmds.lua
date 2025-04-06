-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Override floating highlights",
  callback = function()
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatTitle", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
    vim.api.nvim_set_hl(0, "PmenuExtra", { link = "Comment" })
    vim.api.nvim_set_hl(0, "SnacksIndentScope", { link = "Comment" })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  desc = "Remove line number on oil.nvim buffers",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
