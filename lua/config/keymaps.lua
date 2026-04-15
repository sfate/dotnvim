-- Keymaps for Neovim (mirroring vimrc custom mappings)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Space as leader
vim.g.mapleader = ' '
map({ 'n', 'v', 'o' }, '<Space>', '<Nop>', opts)

-- Fast saving and quitting
map('n', '<Leader>w', '<cmd>w!<CR>', vim.tbl_extend('force', opts, { desc = 'Write file' }))
map('n', '<Leader>q', '<cmd>q!<CR>', vim.tbl_extend('force', opts, { desc = 'Quit without saving' }))

-- Disable arrow keys in all modes
map('i', '<Left>', '<NOP>', opts)
map('i', '<Right>', '<NOP>', opts)
map('i', '<Up>', '<NOP>', opts)
map('i', '<Down>', '<NOP>', opts)
map('n', '<Left>', '<NOP>', opts)
map('n', '<Right>', '<NOP>', opts)
map('n', '<Up>', '<NOP>', opts)
map('n', '<Down>', '<NOP>', opts)
map('n', '<Home>', '<NOP>', opts)
map('n', '<End>', '<NOP>', opts)

-- jj, jk, kk to escape insert mode
map('i', 'jj', '<Esc>', { noremap = true, desc = 'Exit insert mode' })
map('i', 'jk', '<Esc>', { noremap = true, desc = 'Exit insert mode' })
map('i', 'kk', '<Esc>', { noremap = true, desc = 'Exit insert mode' })

-- Move by display lines
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('v', 'j', 'gj', opts)
map('v', 'k', 'gk', opts)

-- Move in insert/command mode with Ctrl
map('i', '<C-h>', '<Left>', opts)
map('i', '<C-j>', '<Down>', opts)
map('i', '<C-k>', '<Up>', opts)
map('i', '<C-l>', '<Right>', opts)
map('c', '<C-h>', '<Left>', opts)
map('c', '<C-j>', '<Down>', opts)
map('c', '<C-k>', '<Up>', opts)
map('c', '<C-l>', '<Right>', opts)

-- System clipboard copy/paste
map('v', '<Leader>y', '"+y', vim.tbl_extend('force', opts, { desc = 'Yank to system clipboard' }))
map('n', '<Leader>p', '"+p', vim.tbl_extend('force', opts, { desc = 'Paste from system clipboard' }))

-- Unhighlight search
map('n', '<Leader>/', '<cmd>call clearmatches() | noh<CR>', vim.tbl_extend('force', opts, { desc = 'Clear search highlights' }))

-- Highlight word under cursor
map('n', '<Leader>h', [[:call clearmatches() | noh | call matchadd('Search', '\<' . escape(expand('<cword>'), '\') . '\>')<CR>]], vim.tbl_extend('force', opts, { desc = 'Highlight word under cursor' }))

-- Buffer and file navigation (FZF)
map('n', '<Leader>b', '<cmd>FzfLua buffers<CR>', vim.tbl_extend('force', opts, { desc = 'Find buffers' }))
map('n', '<Leader>t', '<cmd>FzfLua git_files<CR>', vim.tbl_extend('force', opts, { desc = 'Find git files' }))
map('n', '<Leader><Leader>', '<cmd>FzfLua files<CR>', vim.tbl_extend('force', opts, { desc = 'Find files' }))
map('n', '<Leader>s', '<cmd>FzfLua git_status<CR>', vim.tbl_extend('force', opts, { desc = 'Find changed files' }))
map('n', '<Leader>f', '<cmd>FzfLua live_grep<CR>', vim.tbl_extend('force', opts, { desc = 'Live grep' }))
map('n', '<Leader>*', '<cmd>FzfLua grep_cword<CR>', vim.tbl_extend('force', opts, { desc = 'Grep word under cursor' }))
-- Show diagnostics
map('n', '<Leader>dd', '<cmd>FzfLua diagnostics_document<CR>', vim.tbl_extend('force', opts, { desc = 'Document diagnostics' }))
map('n', '<Leader>dw', '<cmd>FzfLua diagnostics_workspace<CR>', vim.tbl_extend('force', opts, { desc = 'Workspace diagnostics' }))
-- Git blame
map('n', '<Leader>g', '<cmd>Gitsigns blame<CR>', vim.tbl_extend('force', opts, { desc = 'Git blame' }))

-- Reload config
map('n', '<Leader>1', '<cmd>luafile $MYVIMRC<CR><cmd>Lazy sync<CR>', vim.tbl_extend('force', opts, { desc = 'Reload config and sync plugins' }))

-- Unfuck screen (syntax sync)
map('n', '<Leader>u', '<cmd>syntax sync fromstart<CR><cmd>redraw!<CR>', vim.tbl_extend('force', opts, { desc = 'Resync syntax and redraw' }))

-- LSP go-to-definition
map('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
map('n', '<Leader>dt', '<cmd>tab split | lua vim.lsp.buf.definition()<CR>', vim.tbl_extend('force', opts, { desc = 'Go to definition in tab' }))
map('n', '<Leader>dv', '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>', vim.tbl_extend('force', opts, { desc = 'Go to definition in vertical split' }))

-- CSV View toggle
map('n', '<Leader>c', '<cmd>CsvViewToggle delimiter=, display_mode=border header_lnum=1<CR>', vim.tbl_extend('force', opts, { desc = 'Toggle CSV view' }))
