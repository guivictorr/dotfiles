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
-- TODO: Fix ss keymap
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

function M.lsp(buffer)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = buffer, desc = desc })
  end

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
