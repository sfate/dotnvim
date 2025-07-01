-- LSP and linting configuration for Neovim
-- ALE is loaded for Go and Ruby, but you can use built-in LSP for more features

-- Example: Setup Go LSP (gopls) and Ruby LSP
local lspconfig = require('lspconfig')

-- Go
lspconfig.gopls.setup{}

-- Ruby
lspconfig.solargraph.setup{}

-- ALE settings (if using ALE)
vim.g.ale_lint_on_text_changed = 2  -- 2: lint as you type in insert mode
vim.g.ale_lint_on_insert_leave = 1
vim.g.ale_lint_on_enter = 1
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_filetype_changed = 1
vim.g.ale_sign_column_always = 1
vim.g.ale_set_loclist = 1
vim.g.ale_ruby_rubocop_executable = 'bundle'
vim.g.ale_go_golangci_lint_package = 1

-- Show ALE errors as virtual text (inline)
vim.g.ale_virtualtext_cursor = 1
vim.g.ale_virtualtext_prefix = ' '

-- Optional: Keymap to show ALE error under cursor in a floating window
vim.api.nvim_set_keymap('n', '<leader>e', ":ALEDetail<CR>", { noremap = true, silent = true })
