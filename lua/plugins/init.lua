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
  -- Navigation
  { 'ibhagwan/fzf-lua', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  -- Colors
  { 'ellisonleao/gruvbox.nvim' },
  { 'rebelot/kanagawa.nvim' },
  -- UI
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  -- Git
  { "lewis6991/gitsigns.nvim" },
  -- AI
  { 'github/copilot.vim', build = ':Copilot setup' },
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    instructions_file = ".github/copilot-instructions.md",
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      hints = { enabled = false }, -- Disable hints
      inline = { enabled = false },
      selection = {
        enabled = false, -- Disable selection hints!!!
        hint_display = "delayed",
      },
      behaviour = {
        auto_suggestions = false, -- Disable auto-suggestions
        auto_set_highlight_group = true, -- Disable highlight hints
        auto_set_keymaps = true, -- Optional: disable auto keymaps
        auto_approve_tool_permissions = true, -- Optional: disable tool permission prompts
      },
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
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      -- "stevearc/dressing.nvim", -- for input provider dressing
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
    },
  }
})

-- Load plugin configs

require('plugins.lsp')
require('plugins.colorscheme')
require('plugins.statusline')
require('plugins.treesitter')
require('plugins.cmp')
require('plugins.avante')
require('plugins.fzf')
