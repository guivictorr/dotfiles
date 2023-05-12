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
		cmd = "StartupTime",
	},
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('kanagawa').setup {
				colors = {
					theme = { all = { ui = { bg_gutter = 'none' } } }
				}
			}
			vim.cmd [[colorscheme kanagawa]]
		end,
	},
	'jose-elias-alvarez/null-ls.nvim', -- Formatting and Diagnostic
	{
		"williamboman/mason.nvim",      -- Portable package manager,
		config = function()
			require('mason').setup()
		end,
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		dependencies = {
			{
				'williamboman/mason-lspconfig.nvim',
				config = function()
					require('mason-lspconfig').setup {
						automatic_installation = true
					}
				end
			}
		}
	},
	'onsails/lspkind-nvim', -- Pictograms
	{
		'hrsh7th/nvim-cmp',  -- Autocomplete
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
		}
	},
	'neovim/nvim-lspconfig', -- Language server
	{
		'glepnir/lspsaga.nvim',
		event = 'LspAttach',
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{
				'nvim-treesitter/nvim-treesitter', -- Code highlight
				lazy = true,
				build = ':TSUpdate',
				event = "BufRead",
			},
		}
	},
	{
		'windwp/nvim-autopairs',
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
		}
	},
	'lewis6991/gitsigns.nvim', -- Git signs
	'windwp/nvim-ts-autotag',
	{
		'nvim-telescope/telescope-file-browser.nvim', -- File browser
		keys = {
			{ "<leader>sf" }
		}
	},
	{
		'nvim-lualine/lualine.nvim', -- Statusline
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{ "<leader>ff", "<leader>fg" }
		},
		dependencies = {
			"nvim-lua/plenary.nvim"
		}
	},
	{
		"startup-nvim/startup.nvim", -- Startup screen
	}
})
