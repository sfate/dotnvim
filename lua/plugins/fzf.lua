-- This file is part of the FZF Lua plugin for Neovim.
-- DISABLED: Autocommands to handle window resizing and focus loss
-- Disabled due to bugged delays
-- vim.api.nvim_create_autocmd("VimResized", {
--   pattern = '*',
--   callback = function()
--     local ok, fzf = pcall(require, "fzf-lua")
--     if ok and fzf then
--       fzf.stop() -- Close fzf window on resize for proper UI
--     end
--   end
-- })
-- vim.api.nvim_create_autocmd("FocusLost", {
--   pattern = "*",
--   callback = function()
--     local ok, fzf = pcall(require, "fzf-lua")
--     if ok and fzf then
--       fzf.stop() -- Safely stops any active fzf-lua session
--     end
--   end
-- })

require('fzf-lua').setup({
  keymap = {
    fzf = {
      true,
      -- Use <c-q> to select all items and add them to the quickfix list
      ["ctrl-q"] = "select-all+accept",
    },
  },
})
