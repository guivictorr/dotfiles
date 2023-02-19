vim.opt.cmdheight = 0
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.numberwidth = 1
vim.opt.showmode = false
vim.wo.number = true
vim.o.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.termguicolors = true
vim.cmd [[colorscheme no-clown-fiesta]]
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]
