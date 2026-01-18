-- Neovim plugin management using lazy.nvim (recommended for modern Neovim)
-- This file replaces vim-plug and sets up plugins equivalent to those in vimrc

-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- LSP and completion
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip', tag = "v2.4.0" },
  -- Treesitter for better syntax highlighting
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  -- Language packs and syntax
  { 'tpope/vim-commentary', name = 'commentary' },
  { "allaman/tf.nvim", opts = {}, ft = "terraform" },
  -- Navigation
  { 'ibhagwan/fzf-lua', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  -- Colors
  { 'ellisonleao/gruvbox.nvim' },
  -- UI
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { "hat0uma/csvview.nvim" },
  -- Git
  { "lewis6991/gitsigns.nvim" },
  -- AI
  { 'github/copilot.vim', build = ':Copilot setup' }
})

-- Load plugin configs

require('plugins.lsp')
require('plugins.colorscheme')
require('plugins.statusline')
require('plugins.treesitter')
require('plugins.cmp')
require('plugins.fzf')
