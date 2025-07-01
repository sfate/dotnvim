-- Treesitter configuration for Neovim
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'go', 'ruby', 'lua', 'vim', 'bash', 'python', 'json', 'yaml', 'markdown' },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
