-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.diagnostic.config({
  float = { border = "rounded" },
})

-- Remove transparency
vim.opt.pumblend = 0

-- Change color of floating borders
-- vim.api.nvim_set_hl(0, "FzfLuaBorder", { link = "TelescopeBorder" })
vim.api.nvim_set_hl(0, "FloatTitle", { link = "SnacksWinBar" })
vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "FzfLuaBorder" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "FzfLuaBorder" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

-- Open bpytop
vim.api.nvim_create_user_command("Bpytop", function()
  LazyVim.terminal("bpytop")
end, {})
