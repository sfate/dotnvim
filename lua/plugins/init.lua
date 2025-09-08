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
  -- Navigation
  { 'ibhagwan/fzf-lua', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  -- Colors
  { 'ellisonleao/gruvbox.nvim' },
  { 'rebelot/kanagawa.nvim' },
  -- UI
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      dim = {
        -- your dim configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    }
  },
  -- Git
  { "lewis6991/gitsigns.nvim" },
  -- AI
  { 'github/copilot.vim', build = ':Copilot setup' },
  {
    "yetone/avante.nvim",
    build = function()
      return "make"
    end,
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      hints = { enabled = false }, -- Disable hints
      provider = "copilot",
      auto_suggestions_provider = "copilot",
      providers = {
        copilot = {
          model = "gpt-4.1",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
})

-- Load plugin configs

require('plugins.colorscheme')
require('plugins.lsp')
require('plugins.statusline')
require('plugins.treesitter')
require('plugins.cmp')
require('plugins.avante')
require('plugins.fzf')
