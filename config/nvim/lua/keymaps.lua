local keymap = vim.keymap
local M = {}

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- In visual mode replace p to P
-- https://vi.stackexchange.com/questions/39149/how-to-stop-neovim-from-yanking-text-on-pasting-over-selection
keymap.set('x', 'p', 'P')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Split
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Center cursor on scroll
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

keymap.set('n', '<leader>ll', '<CMD>Lazy<CR>', { desc = 'Open Lazy' })
keymap.set('n', '<leader>ch', '<CMD>nohl<CR>', { desc = 'Clear Highlights' })
keymap.set('n', 'C-s', '<CMD>w<CR>', { desc = 'Save Buffer' })
keymap.set('n', '<leader>qq', '<CMD>qa<CR>', { desc = 'Confirm Quit' })
keymap.set('n', '<C-s>', '<CMD>w<CR>', { desc = 'Save Buffer' })
keymap.set('n', '<leader>cn', '<CMD>Noice dismiss<CR>', { desc = 'Clear Notifications' })
keymap.set('n', '<leader>sn', '<CMD>Noice telescope<CR>', { desc = 'Search Notifications' })

function M.telescope(builtin)
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
  vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Files (Cwd)' })
  vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search by Grep' })
  vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
  vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Search Existing Buffers' })
  -- Key mapping for searching in the root folder
  vim.keymap.set('n', '<leader>sF', function()
    builtin.find_files { cwd = require('utils').get_root_dir() }
  end, { desc = 'Search Files (Root Folder)' })
  -- Shortcut for searching my dotfiles
  vim.keymap.set('n', '<leader>sc', function()
    builtin.find_files { cwd = '~/dotfiles' }
  end, { desc = 'Search Config' })
end
function M.lsp(telescope_builtin, buffer)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = buffer, desc = desc })
  end

  map('gd', telescope_builtin.lsp_definitions, 'Goto Definition')
  map('gr', telescope_builtin.lsp_references, 'Goto References')
  map('gI', telescope_builtin.lsp_implementations, 'Goto Implementation')
  map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
  map('<leader>D', telescope_builtin.lsp_type_definitions, 'Type Definition')
  map('<leader>ss', telescope_builtin.lsp_document_symbols, 'Search Symbols')
  map('<leader>sS', telescope_builtin.lsp_dynamic_workspace_symbols, 'Search Workspace Symbols')
  map('<leader>cr', vim.lsp.buf.rename, 'Rename')
  map('<leader>ca', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })
  map(']d', function()
    vim.diagnostic.goto_next { float = true } -- Move to the next diagnostic
    vim.diagnostic.open_float(nil, { focusable = false }) -- Open float window
  end, 'Next Diagnostic')
  map('[d', function()
    vim.diagnostic.goto_prev { float = true } -- Move to the previous diagnostic
    vim.diagnostic.open_float(nil, { focusable = false }) -- Open float window
  end, 'Previous Diagnostic')
end

return M
