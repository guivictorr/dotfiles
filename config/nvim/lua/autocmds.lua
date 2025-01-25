vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    require('keymaps').lsp(require 'telescope.builtin', event.buf)
  end,
})
vim.diagnostic.config {
  float = {
    border = 'rounded',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
}
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'oil',
  desc = 'Remove line number on oil.nvim buffers',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  desc = 'Override floating highlights',
  callback = function()
    vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'FloatTitle', { link = 'Normal' })
  end,
})
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('Kitty', { clear = true }),
  desc = 'Remove kitty terminal padding when neovim open',
  callback = function()
    vim.cmd "silent !kitty @ --to unix:$(ls /tmp/mykitty* 2>/dev/null || echo '') set-spacing padding-left=0 padding-top=0 padding-bottom=0 padding-right=0"
  end,
})
vim.api.nvim_create_autocmd('VimLeave', {
  callback = function()
    vim.cmd "silent !kitty @ --to unix:$(ls /tmp/mykitty* 2>/dev/null || echo '') set-spacing padding-left=default padding-top=default padding-right=default padding-bottom=default"
  end,
})
