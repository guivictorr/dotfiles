local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	'manzeloth/live-server',
	'guivictorr/no-clown-fiesta.nvim',
	'jose-elias-alvarez/null-ls.nvim',
	'nvim-lua/plenary.nvim',
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate" -- :MasonUpdate updates registry contents
	},
	'williamboman/mason-lspconfig.nvim',
	'onsails/lspkind-nvim',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/nvim-cmp',
	'neovim/nvim-lspconfig',
	'glepnir/lspsaga.nvim',
	'L3MON4D3/LuaSnip',
	'windwp/nvim-autopairs',
	'norcalli/nvim-colorizer.lua',
	'kyazdani42/nvim-web-devicons',
	'lewis6991/gitsigns.nvim',
	'akinsho/nvim-bufferline.lua',
	'windwp/nvim-ts-autotag',
	{
		'nvim-treesitter/nvim-treesitter',
		opt = true,
		run = ':TSUpdate',
		event = "BufRead",
	},
	'nvim-telescope/telescope.nvim',
	'nvim-telescope/telescope-file-browser.nvim',
	{
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	},
	{
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	}
})
