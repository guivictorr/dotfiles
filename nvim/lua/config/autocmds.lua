-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

-- Neotree
vim.cmd("highlight NormalNC guibg=none guifg=none")
vim.cmd("highlight NeoTreeEndOfBuffer guibg=#1c2021") -- 1d2021
vim.cmd("highlight NeoTreeNormal guibg=#1c2021")
vim.cmd("highlight NeoTreeWinSeparator guibg=none guifg=#272829")

-- Neotree Float
vim.cmd("highlight NormalFloat guibg=none guifg=none")
vim.cmd("highlight NeoTreeFloatBorder guifg=#A69A85 guibg=#1c2021")
vim.cmd("highlight NeoTreeTitleBar guibg=#A69A85 guifg=#1c2021")
