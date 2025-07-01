-- Neovim plugin manager and plugin list
-- Uses 'wbthomason/packer.nvim' for plugin management

-- Auto-install packer.nvim if not present
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Neovim plugins
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- LSP and completion
  use 'neovim/nvim-lspconfig'           -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp'                -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp
  use 'L3MON4D3/LuaSnip'                -- Snippet engine

  -- Treesitter for better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Telescope (fuzzy finder)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- UI
  use 'nvim-tree/nvim-web-devicons'     -- File icons
  use 'romgrk/barbar.nvim'              -- Bufferline
  use 'itchyny/lightline.vim'           -- Statusline
  use 'gruvbox-community/gruvbox'       -- Colorscheme
  use 'luochen1990/rainbow'             -- Rainbow parentheses
  use 'mhinz/vim-startify'              -- Start screen
  use 'ap/vim-css-color'                -- CSS color preview

  -- Git integration
  use 'lewis6991/gitsigns.nvim'

  -- Commenting
  use 'numToStr/Comment.nvim'

  -- AI
  use {
    'github/copilot.vim',
    run = ':Copilot setup',
  }
end)

-- Load plugin configs
require('plugins.colorscheme')
require('plugins.lsp')
require('plugins.statusline')
require('plugins.telescope')
require('plugins.treesitter')
