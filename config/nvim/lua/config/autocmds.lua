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
    local border = "SnacksPickerBorder"
    local background = "Normal"
    local title = "SnacksPickerTitle"

    vim.api.nvim_set_hl(0, "FloatTitle", { link = title })
    vim.api.nvim_set_hl(0, "Pmenu", { link = background })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = background })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = border })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = border })
    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = border })

    vim.api.nvim_set_hl(0, "PmenuExtra", { link = "Comment" })
    vim.api.nvim_set_hl(0, "SnacksIndentScope", { link = "Comment" })
    vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { link = "CursorColumn" })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { link = "CursorColumn" })
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
