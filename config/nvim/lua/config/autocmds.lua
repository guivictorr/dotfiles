-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.diagnostic.config({
  float = { border = "rounded" },
})

-- Remove transparency
vim.opt.pumblend = 0

-- Change color of floating borders
vim.api.nvim_set_hl(0, "FloatBorder", { link = "TelescopeBorder" })
vim.api.nvim_set_hl(0, "FzfLuaBorder", { link = "TelescopeBorder" })
vim.api.nvim_set_hl(0, "FloatTitle", { link = "TelescopeTitle" })
vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "TelescopeBorder" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

vim.api.nvim_create_user_command("Cd", function()
  require("fzf-lua").fzf_exec(
    'fd --type d --max-depth 1 . ~/personal ~/work ~/dotfiles ~/SecondBrain | sed "s|$HOME/||"',
    {
      actions = {
        ["enter"] = {
          desc = "change-directory",
          fn = function(sel)
            vim.cmd("cd ~/" .. sel[1])
            vim.cmd("Dashboard")
          end,
        },
      },
    }
  )
end, {})

-- Open bpytop
vim.api.nvim_create_user_command("Bpytop", function()
  LazyVim.terminal("bpytop")
end, {})
