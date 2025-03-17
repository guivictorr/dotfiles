local function read_gitignore()
  local patterns = {}
  local file = io.open(".gitignore", "r")
  if file then
    for line in file:lines() do
      line = line:gsub("%s+", "") -- Remove spaces
      if line ~= "" and not line:match("^#") then
        -- Convert gitignore-style patterns to Lua patterns
        local pattern = line:gsub("%.", "%%."):gsub("%*", ".*"):gsub("^/", "^")
        table.insert(patterns, pattern)
      end
    end
    file:close()
  end
  return patterns
end

return {
  -- File Explorer
  {
    "stevearc/oil.nvim",
    keys = {
      { "<leader>e", ":Oil --float<CR>", desc = "Explorer" },
    },
    opts = {
      win_options = {
        signcolumn = "yes",
      },
      keymaps = {
        ["<C-s>"] = "<CMD>w<CR>",
        ["<C-l>"] = "actions.select_vsplit",
        ["q"] = "actions.close",
      },
      float = {
        max_width = 60,
        max_height = 20,
      },
      view_options = {
        is_hidden_file = function(name)
          local gitignore_patterns = read_gitignore()

          local uv = vim.loop -- Neovim's built-in libuv API
          -- Check if it's a folder
          ---@diagnostic disable-next-line: undefined-field
          local stat = uv.fs_stat(name)
          local is_dir = stat and stat.type == "directory"

          -- Hide only dotfolders (not dotfiles)
          if is_dir and name:match("^%.") then
            return true
          end

          for _, pattern in ipairs(gitignore_patterns) do
            if name:match(pattern) then
              return true
            end
          end
        end,
      },
    },
  },
}
