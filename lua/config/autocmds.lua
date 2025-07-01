-- Autocommands for Neovim (mirroring vimrc)
local api = vim.api

-- Highlight custom filetypes
api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = 'Gemfile*',
  command = 'set filetype=ruby',
})
api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*/nginx/*',
  command = 'set filetype=nginx',
})

-- Resize splits when window is resized
api.nvim_create_autocmd('VimResized', {
  pattern = '*',
  command = 'wincmd =',
})

-- Wipe netrw buffer on leave (if using netrw)
api.nvim_create_augroup('netrw', { clear = true })
api.nvim_create_autocmd('FileType', {
  group = 'netrw',
  pattern = 'netrw',
  command = 'setlocal bufhidden=wipe',
})
