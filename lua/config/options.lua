-- General Neovim options (mirroring vimrc settings)
local opt = vim.opt
local g = vim.g

-- Encoding and filetype
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileformats = { 'unix', 'mac', 'dos' }

-- History and swap/backup
opt.history = 700
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.undodir = vim.fn.expand('~/.vim/undo/')

-- UI
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.cursorline = true
opt.showcmd = true
opt.list = true
opt.listchars = { tab = '>-', trail = '⋅', nbsp = '⋅' }
opt.wildmenu = true
opt.wildignore = { '*~', '.svn*', '*.bak', '*.swp', '*.swo' }
opt.wildmode = { 'list:longest', 'full' }
opt.splitbelow = true
opt.splitright = true
opt.mousehide = true
opt.scrolloff = 5
opt.sidescrolloff = 15
opt.synmaxcol = 350
opt.termguicolors = true
opt.laststatus = 2
opt.updatetime = 100
opt.timeoutlen = 1000
opt.ttimeoutlen = 0
opt.errorbells = false
opt.visualbell = true
opt.autoread = true

-- Inline messages
vim.diagnostic.config({ virtual_text = true })

-- Indentation
opt.autoindent = true
opt.copyindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.backspace = { 'indent', 'eol', 'start' }

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.shortmess:remove('S')
opt.path:append('**')

-- Colorscheme
opt.background = 'dark'
g.gruvbox_italic = 0
g.dark_contrast = 'hard'
g.light_contrast = 'hard'
g.rainbow_active = 1
-- 'noshowmode' is not a valid option in Neovim Lua API; remove or use 'opt.showmode = false' if needed
opt.showmode = false

-- Netrw (if using netrw)
g.netrw_altv = 1
g.netrw_fastbrowse = 0
g.netrw_winsize = 20
