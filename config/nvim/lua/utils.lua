local M = {}

function M.get_root_dir()
  -- Check for the .git directory in the current directory hierarchy
  local dir = vim.fn.finddir('.git', ';')
  if dir ~= '' then
    return vim.fn.fnamemodify(dir, ':h') -- Return the directory of the .git folder
  end

  -- Fallback to home directory if .git is not found
  return vim.fn.expand '~'
end

return M
