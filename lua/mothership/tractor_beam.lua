-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

 
  -- Telescope.nvim
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Catppuccin theme
  use { 
	  "catppuccin/nvim", 
	  as = "catppuccin" 
  }


  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use ('nvim-treesitter/playground')

  use ('theprimeagen/harpoon')

  use {
	  "jiaoshijie/undotree",
	  config = function()
		  require('undotree').setup()
	  end,
	  requires = {
		  "nvim-lua/plenary.nvim",
	  },
  }

  use('tpope/vim-fugitive')

  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional
	  },
  }

  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

end)