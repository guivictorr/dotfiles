local status, theme = pcall(require, 'kanagawa')
if (not status) then return end

theme.setup {
	colors = {
		theme = { all = { ui = { bg_gutter = 'none' } } }
	}
}
vim.cmd [[colorscheme kanagawa]]
