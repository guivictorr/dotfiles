return {
  {
    "andweeb/presence.nvim",
    opts = function()
      local function custom_text(prefix, string)
        if string.find(vim.loop.cwd(), "/pecege") then
          return prefix .. " " .. string
        else
          return prefix .. " " .. "%s"
        end
      end
      return {
        buttons = false,
        editing_text = custom_text("Editing", "files"),
        workspace_text = custom_text("Working on", "secret things"),
        file_explorer_text = custom_text("Browsing", "work files"),
        reading_text = custom_text("Reading", "work files"),
      }
    end,
  },
}
