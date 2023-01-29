local status, packer = pcall(require, "packer")
if (not status) then
	print("Packer is not installed")
	return
end

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'aktersnurra/no-clown-fiesta.nvim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'onsails/lspkind-nvim'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'neovim/nvim-lspconfig'
	use 'L3MON4D3/LuaSnip'
	use 'windwp/nvim-autopairs'
	use 'norcalli/nvim-colorizer.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'lewis6991/gitsigns.nvim'
	use 'akinsho/nvim-bufferline.lua'
	use 'windwp/nvim-ts-autotag'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
end)
