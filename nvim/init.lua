-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'

  use { 
  'olivercederborg/poimandres.nvim',
  config = function()
    require('poimandres').setup {}
    vim.cmd('colorscheme poimandres')
  end
}
end)

require'lspconfig'.tsserver.setup{}
