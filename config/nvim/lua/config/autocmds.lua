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
vim.api.nvim_set_hl(0, "FloatTitle", { link = "TelescopeTitle" })
vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "TelescopeBorder" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

-- Open Obsidian Folder
vim.api.nvim_create_user_command("Obsidian", function()
  require("telescope.builtin").find_files({
    cwd = "/Users/guilhermevictor/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain/",
    search_file = "*.md",
  })
end, {})

-- Search specific folders from root
vim.api.nvim_create_user_command("SearchFolders", function()
  require("telescope.builtin").find_files({
    cwd = "~",
    search_dirs = { "personal", "work", "dotfiles" },
  })
end, {})

-- Open bpytop
vim.api.nvim_create_user_command("Bpytop", function()
  LazyVim.terminal("bpytop")
end, {})
