-- Lightline statusline configuration for Neovim
vim.g.lightline = {
  colorscheme = 'gruvbox',
  active = {
    left = { { 'mode', 'paste' }, { 'readonly', 'filename', 'modified' } },
    right = { { 'lineinfo' }, { 'percent' }, { 'fileformat', 'fileencoding', 'filetype' } },
  },
  tabline = {
    right = { { 'close' } },
  },
}

vim.g['lightline#bufferline#enable_devicons'] = 1
vim.g['lightline#bufferline#min_buffer_count'] = 2
vim.g['lightline#bufferline#show_number'] = 1
vim.g['lightline#bufferline#unicode_symbols'] = 1
vim.g['lightline#trailing_whitespace#indicator'] = '•'
