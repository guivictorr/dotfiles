return {
	'f-person/git-blame.nvim',
	{
		'lewis6991/gitsigns.nvim',
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require('gitsigns').setup()
		end
	}
}
