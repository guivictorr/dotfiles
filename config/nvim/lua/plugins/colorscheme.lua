local get_colorsheme = function()
  local builtins = {}

  for name, _ in vim.fs.dir("$VIMRUNTIME/colors/") do
    if name:match("*.txt") then
      break
    else
      name = name:match("(.*).lua$") or name:match("(.*).vim$")
      table.insert(builtins, name)
    end
  end
  local target = vim.fn.getcompletion

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.fn.getcompletion = function()
    return vim.tbl_filter(function(color)
      return not vim.tbl_contains(builtins, color)
      ---@diagnostic disable-next-line: param-type-mismatch
    end, target("", "color"))
  end

  LazyVim.pick("colorscheme", {})()
  vim.fn.getcompletion = target
end

return {
  -- add gruvbox
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
    end,
    keys = {
      { "<leader>uC", get_colorsheme, desc = "Colorscheme with preview" },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
