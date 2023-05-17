return {
	{
		'jose-elias-alvarez/null-ls.nvim',
		config = function()
			local null_ls = require('null-ls')

			null_ls.setup {
				sources = {
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.diagnostics.eslint_d.with({
						diagnostics_format = '[eslint] #{m}\n(#{c})'
					}),
				}
			}
		end
	},
}
