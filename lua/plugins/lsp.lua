-- LSP and linting configuration for Neovim
-- ALE is loaded for Go and Ruby, but you can use built-in LSP for more features

-- Example: Setup Go LSP (gopls) and Ruby LSP
local lspconfig = require('lspconfig')

-- Go
lspconfig.gopls.setup{}

-- Ruby
lspconfig.solargraph.setup{}

-- ALE settings (if using ALE)
vim.g.ale_lint_on_text_changed = 0
vim.g.ale_lint_on_insert_leave = 1
vim.g.ale_lint_on_enter = 1
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_filetype_changed = 1
vim.g.ale_sign_column_always = 1
vim.g.ale_set_loclist = 0
vim.g.ale_ruby_rubocop_executable = 'bundle'
vim.g.ale_go_golangci_lint_package = 1
