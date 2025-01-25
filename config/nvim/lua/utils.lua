local M = {}
local function get_unique_values(...)
  local seen = {}
  local unique = {}

  for _, tbl in ipairs { ... } do
    for _, values in pairs(tbl) do
      for _, value in ipairs(values) do
        if not seen[value] then
          seen[value] = true
          table.insert(unique, value) -- Add to the array
        end
      end
    end
  end

  return unique
end

function M.get_root_dir()
  -- Check for the .git directory in the current directory hierarchy
  local dir = vim.fn.finddir('.git', ';')
  if dir ~= '' then
    return vim.fn.fnamemodify(dir, ':h') -- Return the directory of the .git folder
  end

  -- Fallback to home directory if .git is not found
  return vim.fn.expand '~'
end

M.formatters = {
  lua = { 'stylua' },
  javascript = { 'prettierd' },
  javascriptreact = { 'prettierd' },
  typescript = { 'prettierd' },
  typescriptreact = { 'prettierd' },
  json = { 'prettierd' },
  html = { 'prettierd' },
}
M.linters = {
  javascript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescript = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
}
M.ensure_installed = get_unique_values(M.formatters, M.linters)

return M
