return {
	{
		'rebelot/kanagawa.nvim',
		config = function()
			require('kanagawa').setup {
				colors = {
					theme = { all = { ui = { bg_gutter = 'none' } } }
				}
			}
			vim.cmd [[colorscheme kanagawa]]
		end,
	}
}
