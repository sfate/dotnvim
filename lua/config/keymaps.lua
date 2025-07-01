-- Keymaps for Neovim (mirroring vimrc custom mappings)
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Space as leader
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- Fast saving and quitting
map('n', '<Leader>w', ':w!<CR>', opts)
map('n', '<Leader>q', ':q!<CR>', opts)

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
map('i', 'jj', '<Esc>', { noremap = true })
map('i', 'jk', '<Esc>', { noremap = true })
map('i', 'kk', '<Esc>', { noremap = true })

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
map('v', '<Leader>y', '"+y', opts)
map('n', '<Leader>p', '"+p', opts)

-- Unhighlight search
map('n', '<Leader>/', ':noh<CR>', opts)

-- Highlight word under cursor
map('n', '<Leader>h', ':let @/ = "\\<".expand("<cword>")."\\>"|set hlsearch<CR>', opts)

-- Buffer and file navigation (FZF, Telescope, etc. in plugins)
map('n', '<Leader>b', ':Telescope buffers<CR>', opts)
map('n', '<Leader>t', ':Telescope git_files<CR>', opts)
map('n', '<Leader><Leader>', ':Telescope find_files<CR>', opts)
map('n', '<Leader>s', ':Telescope git_status<CR>', opts)
map('n', '<Leader>f', ':Telescope live_grep<CR>', opts)
map('n', '<Leader>*', ':Telescope grep_string<CR>', opts)
map('n', '<Leader>m', ':Telescope marks<CR>', opts)

-- Reload config
map('n', '<Leader>1', ':luafile $MYVIMRC<CR>', opts)

-- Unfuck screen (syntax sync)
map('n', '<Leader>u', ':syntax sync fromstart<CR>:redraw!<CR>', opts)
