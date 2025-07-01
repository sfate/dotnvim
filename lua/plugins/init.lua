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
  { 'dense-analysis/ale', ft = { 'go', 'ruby', 'python', 'js', 'ts', 'lua' } },
  -- AI
  { 'olimorris/codecompanion.nvim', dependencies = {
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-lua/plenary.nvim' },
    { "MeanderingProgrammer/render-markdown.nvim", -- Enhanced markdown rendering
      dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
      ft = { "markdown", "codecompanion" } }
  } },
  -- Marks
  -- { 'kshenoy/vim-signature' },
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  -- UI
  -- { 'p00f/nvim-ts-rainbow', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  -- { 'mhinz/vim-startify' },
  { 'itchyny/lightline.vim' },
  { 'ellisonleao/gruvbox.nvim' },
  -- { 'ap/vim-css-color' },
  { 'github/copilot.vim', build = ':Copilot setup' },
})

-- Load plugin configs

require('plugins.colorscheme')
require('plugins.lsp')
require('plugins.statusline')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.cmp')
require('plugins.codecompanion')
