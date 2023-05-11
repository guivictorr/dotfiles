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
	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},
	'rebelot/kanagawa.nvim',
	'jose-elias-alvarez/null-ls.nvim', -- Formatting and Diagnostic
	{
		"williamboman/mason.nvim",      -- Portable package manager
		build = ":MasonUpdate"          -- :MasonUpdate updates registry contents
	},
	'williamboman/mason-lspconfig.nvim',
	'onsails/lspkind-nvim', -- Pictograms
	{
		'hrsh7th/nvim-cmp',  -- Autocomplete
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
		}
	},
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
	'windwp/nvim-autopairs',
	{
		'nvim-tree/nvim-web-devicons',
	},
	'lewis6991/gitsigns.nvim', -- Git signs
	{
		'windwp/nvim-ts-autotag',
	},
	'L3MON4D3/LuaSnip',
	{
		'nvim-treesitter/nvim-treesitter', -- Code highlight
		lazy = true,
		build = ':TSUpdate',
		event = "BufRead",
	},
	{
		'nvim-telescope/telescope.nvim', -- File finder
		dependencies = {
			'nvim-lua/plenary.nvim',
		}
	},
	'nvim-telescope/telescope-file-browser.nvim', -- File browser
	{
		'nvim-lualine/lualine.nvim',               -- Statusline
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
	},
	{
		"startup-nvim/startup.nvim", -- Startup screen
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	}
})
