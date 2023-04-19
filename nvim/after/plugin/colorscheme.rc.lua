local status, theme = pcall(require, 'no-clown-fiesta')
if (not status) then return end

theme.setup {}
vim.cmd [[colorscheme no-clown-fiesta]]
