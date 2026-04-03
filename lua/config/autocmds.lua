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

-- Open netrw on no args; handle file:line arguments (e.g. nvim file.go:378)
api.nvim_create_autocmd('VimEnter', {
  nested = true,
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd('Explore')
      return
    end
    local arg = vim.fn.argv(0)
    local file, lnum = arg:match('^(.+):(%d+)$')
    if file and lnum and vim.fn.filereadable(file) == 1 then
      local fake_buf = api.nvim_get_current_buf()
      vim.cmd('edit +' .. lnum .. ' ' .. vim.fn.fnameescape(file))
      if api.nvim_buf_is_valid(fake_buf) then
        api.nvim_buf_delete(fake_buf, { force = true })
      end
    end
  end,
})
