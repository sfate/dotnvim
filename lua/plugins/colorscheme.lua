-- Gruvbox colorscheme and theme settings for Neovim
vim.g.gruvbox_italic = 0
vim.g.dark_contrast = 'hard'
vim.g.light_contrast = 'hard'

local focus_dim_groups = {
  'Normal',
  'NormalNC',
  'SignColumn',
  'EndOfBuffer',
  'FoldColumn',
  'LineNr',
  'CursorLine',
  'CursorLineNr',
  'WinSeparator',
  'StatusLine',
  'StatusLineNC',
  'WinBar',
  'WinBarNC',
  'Comment',
  'Constant',
  'String',
  'Character',
  'Number',
  'Boolean',
  'Float',
  'Identifier',
  'Function',
  'Statement',
  'Conditional',
  'Repeat',
  'Label',
  'Operator',
  'Keyword',
  'Exception',
  'PreProc',
  'Include',
  'Define',
  'Macro',
  'PreCondit',
  'Type',
  'StorageClass',
  'Structure',
  'Typedef',
  'Special',
  'SpecialChar',
  'Tag',
  'Delimiter',
  'SpecialComment',
  'Debug',
  'Underlined',
  'Todo',
  'DiagnosticError',
  'DiagnosticWarn',
  'DiagnosticInfo',
  'DiagnosticHint',
  'DiagnosticOk',
  'DiagnosticVirtualTextError',
  'DiagnosticVirtualTextWarn',
  'DiagnosticVirtualTextInfo',
  'DiagnosticVirtualTextHint',
  'DiagnosticVirtualTextOk',
  'DiffAdd',
  'DiffChange',
  'DiffDelete',
  'DiffText',
  '@text',
  '@text.literal',
  '@text.reference',
  '@text.title',
  '@text.uri',
  '@text.underline',
  '@text.todo',
  '@comment',
  '@punctuation',
  '@punctuation.delimiter',
  '@punctuation.bracket',
  '@punctuation.special',
  '@constant',
  '@constant.builtin',
  '@constant.macro',
  '@string',
  '@string.regex',
  '@string.escape',
  '@character',
  '@number',
  '@boolean',
  '@float',
  '@function',
  '@function.builtin',
  '@function.call',
  '@function.macro',
  '@method',
  '@method.call',
  '@constructor',
  '@parameter',
  '@keyword',
  '@keyword.function',
  '@keyword.operator',
  '@keyword.return',
  '@conditional',
  '@repeat',
  '@label',
  '@operator',
  '@exception',
  '@variable',
  '@variable.builtin',
  '@type',
  '@type.builtin',
  '@type.definition',
  '@storageclass',
  '@namespace',
  '@include',
  '@preproc',
  '@debug',
  '@tag',
  '@tag.attribute',
  '@tag.delimiter',
}

local focus_original_hl = {}
local nvim_has_focus = true

local function inactive_foreground()
  if vim.o.background == 'dark' then
    return '#928374'
  end

  return '#7c6f64'
end

local function capture_focus_highlights()
  focus_original_hl = {}

  for _, group in ipairs(focus_dim_groups) do
    focus_original_hl[group] = vim.api.nvim_get_hl(0, { name = group, link = false })
  end
end

local function apply_focus_foreground()
  if nvim_has_focus then
    for group, hl in pairs(focus_original_hl) do
      vim.api.nvim_set_hl(0, group, hl)
    end
    return
  end

  local fg = inactive_foreground()
  for _, group in ipairs(focus_dim_groups) do
    local hl = vim.tbl_extend('force', focus_original_hl[group] or {}, { fg = fg })
    vim.api.nvim_set_hl(0, group, hl)
  end
end

local focus_group = vim.api.nvim_create_augroup('tmux_focus_background', { clear = true })

vim.api.nvim_create_autocmd('FocusGained', {
  group = focus_group,
  callback = function()
    nvim_has_focus = true
    apply_focus_foreground()
  end,
})

vim.api.nvim_create_autocmd('FocusLost', {
  group = focus_group,
  callback = function()
    nvim_has_focus = false
    apply_focus_foreground()
  end,
})

vim.api.nvim_create_user_command('NvimPaneActive', function()
  nvim_has_focus = true
  apply_focus_foreground()
end, {})

vim.api.nvim_create_user_command('NvimPaneInactive', function()
  nvim_has_focus = false
  apply_focus_foreground()
end, {})

function set_theme_from_system()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()

  -- Clear cached module failures so nvim-web-devicons can reload cleanly
  package.loaded['nvim-web-devicons.icons-light'] = nil
  package.loaded['nvim-web-devicons.light.icons_by_filename'] = nil
  package.loaded['nvim-web-devicons.light.icons_by_file_extension'] = nil
  package.loaded['nvim-web-devicons.light.icons_by_operating_system'] = nil
  package.loaded['nvim-web-devicons.light.icons_by_desktop_environment'] = nil
  package.loaded['nvim-web-devicons.light.icons_by_window_manager'] = nil

  if result:match("Dark") then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
  vim.cmd("colorscheme gruvbox")
  capture_focus_highlights()
  apply_focus_foreground()
end

-- Call on startup
set_theme_from_system()
