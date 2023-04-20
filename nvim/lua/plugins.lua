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
	'manzeloth/live-server',          -- To run simple html projects
	'guivictorr/no-clown-fiesta.nvim', -- Theme
	'jose-elias-alvarez/null-ls.nvim', -- Formatting and Diagnostic
	'nvim-lua/plenary.nvim',
	{
		"williamboman/mason.nvim", -- Portable package manager
		build = ":MasonUpdate"   -- :MasonUpdate updates registry contents
	},
	'williamboman/mason-lspconfig.nvim',
	'onsails/lspkind-nvim', -- Pictograms
	'hrsh7th/nvim-cmp',    -- Autocomplete
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-nvim-lsp',
	'neovim/nvim-lspconfig', -- Language server
	{
		'glepnir/lspsaga.nvim',
		event = 'LspAttach',
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" }
		}
	},
	'L3MON4D3/LuaSnip',
	'windwp/nvim-autopairs',
	'norcalli/nvim-colorizer.lua',
	'nvim-tree/nvim-web-devicons',
	'lewis6991/gitsigns.nvim',    -- Git signs
	'akinsho/nvim-bufferline.lua', -- Tabs
	'windwp/nvim-ts-autotag',
	{
		'nvim-treesitter/nvim-treesitter', -- Code highlight
		opt = true,
		run = ':TSUpdate',
		event = "BufRead",
	},
	'nvim-telescope/telescope.nvim',             -- File finder
	'nvim-telescope/telescope-file-browser.nvim', -- File browser
	{
		'nvim-lualine/lualine.nvim',               -- Statusline
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	},
	{
		"startup-nvim/startup.nvim", -- Startup screen
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	}
})
