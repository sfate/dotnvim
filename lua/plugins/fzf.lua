-- This file is part of the FZF Lua plugin for Neovim.
vim.api.nvim_create_autocmd("VimResized", {
  pattern = '*',
  command = 'lua require("fzf-lua").redraw()'
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
