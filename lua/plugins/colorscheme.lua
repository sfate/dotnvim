-- Gruvbox colorscheme and theme settings for Neovim
vim.o.background = vim.o.background or 'dark'
vim.g.gruvbox_italic = 0
vim.g.dark_contrast = 'hard'
vim.g.light_contrast = 'hard'

vim.cmd [[colorscheme gruvbox]]

-- Reload lightline colorscheme if using lightline
vim.cmd [[
  if exists(':LightlineReload')
    :LightlineReload
  endif
]]
