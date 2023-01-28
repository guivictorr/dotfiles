vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'onsails/lspkind-nvim' -- vscode-like pictograms
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
	use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
	use 'hrsh7th/nvim-cmp' -- Completion
	use 'neovim/nvim-lspconfig' -- LSP
	use 'L3MON4D3/LuaSnip'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use {
		'olivercederborg/poimandres.nvim',
		config = function()
			require('poimandres').setup {}
		end
	}
end)
