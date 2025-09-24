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
  actions = {
    files = {
      ["enter"]  = FzfLua.actions.file_edit_or_qf,
      ["ctrl-s"] = FzfLua.actions.file_split,
      ["ctrl-v"] = FzfLua.actions.file_vsplit,
      ["ctrl-t"] = FzfLua.actions.file_tabedit,
      ["alt-q"]  = FzfLua.actions.file_sel_to_qf,
      ["alt-Q"]  = FzfLua.actions.file_sel_to_ll,
      ["alt-i"]  = FzfLua.actions.toggle_ignore,
      ["alt-h"]  = FzfLua.actions.toggle_hidden,
      ["alt-f"]  = FzfLua.actions.toggle_follow,
    },
  },
})
