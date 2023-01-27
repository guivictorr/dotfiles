vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
       use 'wbthomason/packer.nvim'
       use 'neovim/nvim-lspconfig'
       use 'jose-elias-alvarez/null-ls.nvim'
       use 'nvim-lua/plenary.nvim'
       use 'williamboman/mason.nvim'
       use 'williamboman/mason-lspconfig.nvim'
       use {
               'nvim-lualine/lualine.nvim',
               requires = { 'kyazdani42/nvim-web-devicons', opt = true }
       }

       use {
               'olivercederborg/poimandres.nvim',
               config = function()
                       require('poimandres').setup {}
                       vim.cmd('colorscheme poimandres')
               end
       }
end)
