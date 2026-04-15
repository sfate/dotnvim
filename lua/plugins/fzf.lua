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

if #vim.api.nvim_list_uis() == 0 then
  return
end

local fzf = require('fzf-lua')

fzf.setup({
  actions = {
    files = {
      ["enter"]  = fzf.actions.file_edit_or_qf,
      ["ctrl-s"] = fzf.actions.file_split,
      ["ctrl-v"] = fzf.actions.file_vsplit,
      ["ctrl-t"] = fzf.actions.file_tabedit,
      ["alt-q"]  = fzf.actions.file_sel_to_qf,
      ["alt-Q"]  = fzf.actions.file_sel_to_ll,
      ["alt-i"]  = fzf.actions.toggle_ignore,
      ["alt-h"]  = fzf.actions.toggle_hidden,
      ["alt-f"]  = fzf.actions.toggle_follow,
    },
  },
})
