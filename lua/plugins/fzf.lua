-- This file is part of the FZF Lua plugin for Neovim.
vim.api.nvim_create_autocmd("VimResized", {
  pattern = '*',
  command = 'lua require("fzf-lua").redraw()'
})
vim.api.nvim_create_autocmd("FocusLost", {
  pattern = "*",
  callback = function()
    local ok, fzf = pcall(require, "fzf-lua")
    if ok and fzf then
      fzf.stop() -- Safely stops any active fzf-lua session
    end
  end
})


require('fzf-lua').setup({
  keymap = {
    fzf = {
      true,
      -- Use <c-q> to select all items and add them to the quickfix list
      ["ctrl-q"] = "select-all+accept",
    },
  },
})
