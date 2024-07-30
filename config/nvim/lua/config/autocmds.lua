-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.diagnostic.config({
  float = { border = "rounded" },
})

vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatTitle", { link = "Normal" })
vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

-- Open Obsidian Folder
vim.api.nvim_create_user_command("Obsidian", function()
  require("telescope.builtin").find_files({
    cwd = "/Users/guilhermevictor/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain/",
    find_command = { "rg", "--files", "--iglob", "!.obsidian", "--iglob", "!.trash" },
  })
end, {})
